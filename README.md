

# RHEV/Ovirt API Server
```
curl -k https://rhv-m.pst.rockplace.co.kr/ovirt-engine/api -u "admin@internal:<password>" -X GET -H "Accept: application/xml" 
```

# GET Cluster ID using the REST API
```
curl -k https://rhv-m.pst.rockplace.co.kr/ovirt-engine/api/clusters -u "admin@internal:<password>" -H "filter: true"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<clusters>
    <cluster href="/ovirt-engine/api/clusters/b88ce044-e54b-11ea-b386-525400a97cd1" id="b88ce044-e54b-11ea-b386-525400a97cd1">
    ...
</clusters>
```

# GET Template ID using the REST API
```
curl -k https://rhv-m.pst.rockplace.co.kr/ovirt-engine/api/templates -u "admin@internal:<passowrd>" -H "filter: true"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<templates>
    ...
    <template href="/ovirt-engine/api/templates/e35aa687-8e84-49ab-9dbb-d25acd3f2b47" id="e35aa687-8e84-49ab-9dbb-d25acd3f2b47">
        <actions>
            <link href="/ovirt-engine/api/templates/e35aa687-8e84-49ab-9dbb-d25acd3f2b47/export" rel="export"/>
        </actions>
        <name>11-centos78-terraform-template</name>
        <description>cloud-init</description>
    ...
    </template>
    ...
<templates>    
```
# GET Networks ID using the REST API
```
curl -k https://rhv-m.pst.rockplace.co.kr/ovirt-engine/api/networks -u "admin@internal:<passowrd>" -H "filter: true"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<networks>
    <network href="/ovirt-engine/api/networks/00000000-0000-0000-0000-000000000009" id="00000000-0000-0000-0000-000000000009">
        <name>ovirtmgmt</name>
    ...
    </network>
    ...
</networks>    
```        

# GET Storagegedomain ID using the REST API
```
curl -k https://rhv-m.pst.rockplace.co.kr/ovirt-engine/api/storagedomains -u "admin@internal:<passowrd>" -H "filter: true"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<storage_domains>
    ...
    <storage_domain href="/ovirt-engine/api/storagedomains/db90ad33-cf38-490f-8a0a-22961b7a8ee2" id="db90ad33-cf38-490f-8a0a-22961b7a8ee2">
        <actions>
            <link href="/ovirt-engine/api/storagedomains/db90ad33-cf38-490f-8a0a-22961b7a8ee2/isattached" rel="isattached"/>
            <link href="/ovirt-engine/api/storagedomains/db90ad33-cf38-490f-8a0a-22961b7a8ee2/updateovfstore" rel="updateovfstore"/>
            <link href="/ovirt-engine/api/storagedomains/db90ad33-cf38-490f-8a0a-22961b7a8ee2/refreshluns" rel="refreshluns"/>
            <link href="/ovirt-engine/api/storagedomains/db90ad33-cf38-490f-8a0a-22961b7a8ee2/reduceluns" rel="reduceluns"/>
        </actions>
        <name>00_SAN_STORAGE</name>
        ...
    </storage_domain>
<storage_domains>    
```
# GET cpuprofiles using the REST API
```
curl -k https://rhv-m.pst.rockplace.co.kr/ovirt-engine/api/cpuprofiles -u "admin@internal:<password>" -X GET -H "Accept: application/xml" 
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<cpu_profiles>
    <cpu_profile href="/ovirt-engine/api/clusters/b88ce044-e54b-11ea-b386-525400a97cd1/cpuprofiles/58ca604e-01a7-003f-01de-000000000250" id="58ca604e-01a7-003f-01de-000000000250">
        <name>Default</name>
        <link href="/ovirt-engine/api/clusters/b88ce044-e54b-11ea-b386-525400a97cd1/cpuprofiles/58ca604e-01a7-003f-01de-000000000250/permissions" rel="permissions"/>
        <cluster href="/ovirt-engine/api/clusters/b88ce044-e54b-11ea-b386-525400a97cd1" id="b88ce044-e54b-11ea-b386-525400a97cd1"/>
    </cpu_profile>
</cpu_profiles>
```

# Create VM using the REST API 
```
curl -k -X POST -H "Accept: application/xml" -H "Content-Type: application/xml" -u "admin@internal:<password>" -d "<vm><name>vm1</name><cluster><name>PST_CL</name></cluster><template><name>01-centos78-template</name></template><memory>17179869184</memory><os><boot dev='hd'/></os><cpu_profile id='58ca604e-01a7-003f-01de-000000000250'/></vm>" https://rhv-m.pst.rockplace.co.kr/ovirt-engine/api/vms
```

# Referer
https://access.redhat.com/documentation/en-us/red_hat_virtualization/4.3/html-single/version_3_rest_api_guide/index#Start_Virtual_Machine_with_Cloud-Init_Action


# terraform ovirt provider build
```
git clone https://github.com/oVirt/terraform-provider-ovirt
cd terraform-provider-ovirt
```

# windows
```
docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp -e GOOS=windows -e GOARCH=386 golang:1.14 go build -v
```

# linux
```
docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:1.14 go build -v
```

# Configure terraform ovirt provider binary
```
mv terraform-provider-ovirt $K8S_TERRAFORM_HOME/ovirt/
cd $K8S_TERRAFORM_HOME/ovirt/

## must be change local variables
locals {
  vm_prefix = "example" #CHANGEME
  vm_domains = "example.com" #CHANGEME
  vm_username = "terra" #CHANGEME
}

# Create VM call controller-0 
module "controller-0" {
  ...
 
  ## must be change on each 
  vm_nic_device     = "eth0"
  vm_nic_ip_address = "10.65.40.11"  #CHANGEME
  vm_nic_gateway    = "10.65.40.1"    
  vm_nic_netmask    = "255.255.255.0"
}
```


# Rung terraform ovirt provider binary
```
terraform init

terraform plan

terraform apply -parallelism=2

terraform destroy -parallelism=2
```
