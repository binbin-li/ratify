/*
Copyright The Ratify Authors.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package opa

import (
	"context"
	"errors"
	"strings"

	"github.com/deislabs/ratify/pkg/policyprovider/policyengine"
	"github.com/deislabs/ratify/pkg/policyprovider/policyquery"
)

const OPA = "opa"

// OpaEngine is an OPA engine implementing PolicyEvaluator interface.
type OpaEngine struct {
	query policyquery.PolicyQuery
}

// OpaEngineFactory is a factory for creating OPA engines.
type OpaEngineFactory struct{}

func init() {
	policyengine.Register(OPA, &OpaEngineFactory{})
}

// Create creates a new OPA engine.
func (f *OpaEngineFactory) Create(policy string, queryLanguage string) (policyengine.PolicyEngine, error) {
	engine := &OpaEngine{}
	trimmedPolicy := strings.TrimSpace(policy)
	if trimmedPolicy == "" {
		return nil, errors.New("policy is empty")
	}

	query, err := policyquery.CreateQueryFromConfig(policyquery.PolicyQueryConfig{
		Name:   queryLanguage,
		Policy: trimmedPolicy,
	})
	if err != nil {
		return nil, err
	}

	engine.query = query
	return engine, nil
}

// Evaluate evaluates the policy with the given input.
func (oe *OpaEngine) Evaluate(ctx context.Context, input map[string]interface{}) (bool, error) {
	return oe.query.Evaluate(ctx, input)
}
