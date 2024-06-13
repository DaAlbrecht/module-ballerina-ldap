// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com)
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Provides a set of configurations to control the behaviours when communicating with a schema registry.
#
# + hostName - The host name of the Active Directory server
# + port -  The port of the Active Directory server
# + domainName -  The domain name of the Active Directory
# + password - The password of the Active Directory
public type ConnectionConfig record {|
    string hostName;
    int port;
    string domainName;
    string password;
|};

# LDAP response type.
#
# + matchedDN - The matched DN from the response
# + resultCode - The operation status of the response
# + operationType - The protocol operation type
public type LdapResponse record {|
    string matchedDN;
    Status resultCode;
    string operationType;
|};

# LDAP search result type.
#
# + resultCode - The result status of the response
# + searchReferences - search references
# + entries - The entries returned from the search
public type SearchResult record {|
    Status resultCode;
    SearchReference[] searchReferences?;
    Entry[] entries?;
|};

# LDAP search reference type.
#
# + messageId - The message ID
# + uris - The referral URIs
# + controls - The controls
public type SearchReference record {|
    int messageId;
    string[] uris;
    Control[] controls;
|};

# LDAP control type.
#
# + oid - The OID of the control
# + isCritical - The criticality of the control
# + value - The value of the control
public type Control record {|
    string oid;
    boolean isCritical;
    string value;
|};

# Scope of the search operation.
# 
# BASE - Indicates that only the entry specified by the base DN should be considered. \
# ONE - Indicates that only entries that are immediate subordinates of the entry specified by the base DN (but not the base entry itself) should be considered. \
# SUB - Indicates that the base entry itself and any subordinate entries (to any depth) should be considered. \
# SUBORDINATE_SUBTREE - Indicates that any subordinate entries (to any depth) below the entry specified by the base DN should be considered, but the base entry itself should not be considered, as described in draft-sermersheim-ldap-subordinate-scope.
public enum SearchScope {
    BASE,
    ONE,
    SUB,
    SUBORDINATE_SUBTREE
};

public type Entry record {};

# A record for an entry that represents a person.
#
# + objectClass - object class of the person
# + sn - surname of the person
# + cn - common name of the person
# + userPassword - password of the person
# + telephoneNumber - telephone number of the person
public type Person record {
    string|string[]|ObjectClass|ObjectClass[] objectClass?;
    string sn?;
    string cn?;
    string userPassword?;
    string telephoneNumber?;
};

# Standard values for ObjectClass attribute type.
public enum ObjectClass {
    top,
    person,
    organizationalPerson,
    inetOrgPerson,
    organizationalRole,
    groupOfNames,
    groupOfUniqueNames,
    country,
    locality,
    organization,
    organizationalUnit,
    domainComponent,
    dcObject
};

# A record for an entry to contain domain component information
#
# + dc - name of the domain component
public type DcObject record {
    string dc;
};

# Represents the status of the operation
public enum Status {
    SUCCESS,
    OPERATIONS_ERROR = "OPERATIONS ERROR",
    PROTOCOL_ERROR = "PROTOCOL ERROR",
    TIME_LIMIT_EXCEEDED = "TIME LIMIT EXCEEDED",
    SIZE_LIMIT_EXCEEDED = "SIZE LIMIT EXCEEDED",
    COMPARE_FALSE = "COMPARE FALSE",
    COMPARE_TRUE = "COMPARE TRUE",
    AUTH_METHOD_NOT_SUPPORTED = "AUTH METHOD NOT SUPPORTED",
    STRONGER_AUTH_REQUIRED = "STRONGER AUTH REQUIRED",
    REFERRAL,
    ADMIN_LIMIT_EXCEEDED = "ADMIN LIMIT EXCEEDED",
    UNAVAILABLE_CRITICAL_EXTENSION = "UNAVAILABLE CRITICAL EXTENSION",
    CONFIDENTIALITY_REQUIRED = "CONFIDENTIALITY REQUIRED",
    SASL_BIND_IN_PROGRESS = "SASL BIND IN PROGRESS",
    NO_SUCH_ATTRIBUTE = "NO SUCH ATTRIBUTE",
    UNDEFINED_ATTRIBUTE_TYPE = "UNDEFINED ATTRIBUTE TYPE",
    INAPPROPRIATE_MATCHING = "INAPPROPRIATE MATCHING",
    CONSTRAINT_VIOLATION = "CONSTRAINT VIOLATION",
    ATTRIBUTE_OR_VALUE_EXISTS = "ATTRIBUTE OR VALUE EXISTS",
    INVALID_ATTRIBUTE_SYNTAX = "INVALID ATTRIBUTE SYNTAX",
    NO_SUCH_OBJECT = "NO SUCH OBJECT",
    ALIAS_PROBLEM = "ALIAS PROBLEM",
    INVALID_DN_SYNTAX = "INVALID DN SYNTAX",
    ALIAS_DEREFERENCING_PROBLEM = "ALIAS DEREFERENCING PROBLEM",
    INAPPROPRIATE_AUTHENTICATION = "INAPPROPRIATE AUTHENTICATION",
    INVALID_CREDENTIALS = "INVALID CREDENTIALS",
    INSUFFICIENT_ACCESS_RIGHTS = "INSUFFICIENT ACCESS RIGHTS",
    BUSY,
    UNAVAILABLE,
    UNWILLING_TO_PERFORM = "UNWILLING TO PERFORM",
    LOOP_DETECT = "LOOP DETECT",
    NAMING_VIOLATION = "NAMING VIOLATION",
    OBJECT_CLASS_VIOLATION = "OBJECT CLASS VIOLATION",
    NOT_ALLOWED_ON_NON_LEAF = "NOT ALLOWED ON NON LEAF",
    NOT_ALLOWED_ON_RDN = "NOT ALLOWED ON RDN",
    ENTRY_ALREADY_EXISTS = "ENTRY ALREADY EXISTS",
    OBJECT_CLASS_MODS_PROHIBITED = "OBJECT CLASS MODS PROHIBITED",
    AFFECTS_MULTIPLE_DSAS = "AFFECTS MULTIPLE DSAS",
    OTHER
}
