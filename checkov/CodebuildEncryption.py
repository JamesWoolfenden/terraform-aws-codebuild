from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck



class CodebuildEncryption(BaseResourceCheck):
    def __init__(self):
        name = "Codebuild Encryption at rest not disabled if Artifacts are made"
        id = "CKV_AWS_999"
        supported_resources = ['aws_codebuild_project']
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "artifacts" in conf.keys():
            if "encryption_disabled" in conf["artifacts"][0].keys():
                if conf["artifacts"][0]["encryption_disabled"][0] == False:
                   return CheckResult.PASSED
                else:
                    if conf["artifacts"][0]["type"][0] != "NO_ARTIFACTS":
                        return CheckResult.FAILED
                    else:
                        return CheckResult.PASSED
            else:
                return CheckResult.PASSED
        else:
                return CheckResult.PASSED

check = CodebuildEncryption()
