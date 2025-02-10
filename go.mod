module github.com/ratify-project/ratify

go 1.23.3

// Accidentally published prior to 1.0.0 release
retract (
	v1.1.0-alpha.2 // contains retractions only
	v1.1.0-alpha.1 // published in error
)

require (
	github.com/gorilla/mux v1.8.1
	github.com/notaryproject/notation-go v1.3.1
	github.com/open-policy-agent/frameworks/constraint v0.0.0-20230411224310-3f237e2710fa
	github.com/ratify-project/ratify-go v0.0.0-20250409024354-c68911760c98
	github.com/sirupsen/logrus v1.9.3
)

require (
	github.com/Azure/go-ntlmssp v0.0.0-20221128193559-754e69321358 // indirect
	github.com/fxamacker/cbor/v2 v2.7.0 // indirect
	github.com/go-asn1-ber/asn1-ber v1.5.7 // indirect
	github.com/go-ldap/ldap/v3 v3.4.10 // indirect
	github.com/golang-jwt/jwt/v4 v4.5.1 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/notaryproject/notation-core-go v1.2.0 // indirect
	github.com/notaryproject/notation-plugin-framework-go v1.0.0 // indirect
	github.com/notaryproject/tspclient-go v1.0.0 // indirect
	github.com/veraison/go-cose v1.3.0 // indirect
	github.com/x448/float16 v0.8.4 // indirect
	golang.org/x/crypto v0.33.0 // indirect
	golang.org/x/mod v0.23.0 // indirect
)

require (
	github.com/OneOfOne/xxhash v1.2.8 // indirect
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/google/gofuzz v1.2.0 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/open-policy-agent/opa v0.68.0 // indirect
	github.com/opencontainers/go-digest v1.0.0 // indirect
	github.com/opencontainers/image-spec v1.1.1 // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/ratify-project/ratify-verifier-go/notation v0.0.0-20250312032346-33212c6bd913
	github.com/rcrowley/go-metrics v0.0.0-20201227073835-cf1acfcdf475 // indirect
	github.com/rogpeppe/go-internal v1.13.1 // indirect
	github.com/stretchr/testify v1.10.0 // indirect
	github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb // indirect
	github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415 // indirect
	golang.org/x/net v0.34.0 // indirect
	golang.org/x/sync v0.11.0 // indirect
	golang.org/x/sys v0.30.0 // indirect
	golang.org/x/text v0.22.0 // indirect
	gopkg.in/inf.v0 v0.9.1 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	k8s.io/apimachinery v0.28.15 // indirect
	k8s.io/klog/v2 v2.130.1 // indirect
	k8s.io/utils v0.0.0-20240502163921-fe8a2dddb1d0 // indirect
	oras.land/oras-go/v2 v2.5.0 // indirect
	sigs.k8s.io/json v0.0.0-20221116044647-bc3834ca7abd // indirect
	sigs.k8s.io/structured-merge-diff/v4 v4.3.0 // indirect
	sigs.k8s.io/yaml v1.4.0 // indirect
)
