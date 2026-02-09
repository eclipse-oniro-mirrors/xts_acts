/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import BackupExtensionAbility from '@ohos.application.BackupExtensionAbility';
import { BundleVersion } from '@ohos.application.BackupExtensionAbility';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
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
         * @tc.name   backup_extension_test_call_static_000
         * @tc.number SUB_BACKUP_EXTENSION_CALL_0000
         * @tc.desc   select with option
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
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
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'backupextension error:'+ JSON.stringify(error));
                expect(false).assertTrue()
                done()
            }
        })
    })
    hilog.info(domain, tag, '%{public}s', 'backupExtension end');
}