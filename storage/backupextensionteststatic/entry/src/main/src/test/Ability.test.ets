import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import BackupExtensionAbility from '@ohos.application.BackupExtensionAbility';
import { BundleVersion } from '@ohos.application.BackupExtensionAbility';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';

export class BackupExt extends BackupExtensionAbility {
    onRestore(ver: BundleVersion) {
        hilog.info(domain, tag, '%{public}s', 'do restore ' + JSON.stringify(ver));
    }

    onBackup() {
        hilog.info(domain, tag, '%{public}s', 'do backup.');
    }
};

export default function abilityTest() {
    let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    describe("backupExtension", (): void => {
        hilog.info(domain, tag, '%{public}s', 'backupExtension start');
        /**
         * @tc.number    : SUB_BACKUP_EXTENSION_CALL_0000
         * @tc.name      : backup_extension_test_call_static_000
         * @tc.desc      : select with option
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("backup_extension_test_call_static_000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                hilog.info(domain, tag, '%{public}s', 'backup-extension run start');
                let backupExt = new BackupExt()
                backupExt.onBackup()
                let ver: BundleVersion = {
                    code: 1,
                    name: '1.0.0.0',
                }
                backupExt.onRestore(ver)
                hilog.info(domain, tag, '%{public}s', 'backup-extension run ok');
                expect(true).assertTrue()
                done()
            } catch (error: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'backupextension error:'+ JSON.stringify(error));
                expect(false).assertTrue()
                done()
            }
        })
    })
    hilog.info(domain, tag, '%{public}s', 'backupExtension end');
}