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

package thresholdpolicy

import (
	"testing"

	"github.com/notaryproject/ratify/v2/internal/policyenforcer/factory"
)

func TestNewPolicyEnforcer(t *testing.T) {
	tests := []struct {
		name      string
		opts      *factory.NewPolicyEnforcerOptions
		expectErr bool
	}{
		{
			name: "Unsupported params",
			opts: &factory.NewPolicyEnforcerOptions{
				Type:       thresholdPolicyType,
				Parameters: make(chan int),
			},
			expectErr: true,
		},
		{
			name: "Malformed params",
			opts: &factory.NewPolicyEnforcerOptions{
				Type:       thresholdPolicyType,
				Parameters: "{",
			},
			expectErr: true,
		},
		{
			name: "Nil policy",
			opts: &factory.NewPolicyEnforcerOptions{
				Type:       thresholdPolicyType,
				Parameters: map[string]any{},
			},
			expectErr: true,
		},
		{
			name: "No rules provided",
			opts: &factory.NewPolicyEnforcerOptions{
				Type: thresholdPolicyType,
				Parameters: map[string]any{
					"policy": map[string]any{},
				},
			},
			expectErr: true,
		},
		{
			name: "Embedded nil rules",
			opts: &factory.NewPolicyEnforcerOptions{
				Type: thresholdPolicyType,
				Parameters: map[string]any{
					"policy": map[string]any{
						"rules": []any{nil},
					},
				},
			},
			expectErr: true,
		},
		{
			name: "Valid rules",
			opts: &factory.NewPolicyEnforcerOptions{
				Type: thresholdPolicyType,
				Parameters: map[string]any{
					"policy": map[string]any{
						"rules": []any{
							map[string]any{
								"verifierName": "test-verifier",
							},
						},
					},
				},
			},
			expectErr: false,
		},
	}

	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			_, err := factory.NewPolicyEnforcer(test.opts)
			if (err != nil) != test.expectErr {
				t.Fatalf("Expected error: %v, but got: %v", test.expectErr, err)
			}
		})
	}
}
