/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;

export default function webJsunit() {
  describe('createPdfTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err : BusinessError|null) : void => {
        if (err != null ) {

          console.log('-----' + err.code)
        }

        console.log('BusinessError  end')
      })
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.webPageDocumentProcessingTwo.test.static')
        .then(result => {
          console.info('Command executed successfully:', result);
        })
        .catch(err => {
          console.error('Error executing command:', err);
        });
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(1000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   SavePDFStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_CREATEPDF_001
     * @tc.desc   get createPdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SavePDFStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSavePDF', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitSavePDF', true, 20241127, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webSavePDF', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   SavePDF1Static
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_CREATEPDF_002
     * @tc.desc   get createPdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SavePDF1Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSavePDF1', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitSavePDF', true, 20241128, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webSavePDF', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   SavePDF2Static
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_CREATEPDF_003
     * @tc.desc   get createPdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SavePDF2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSavePDF2', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitSavePDF', true, 20260325, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webSavePDF', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   SavePDF3Static
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_CREATEPDF_004
     * @tc.desc   get createPdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SavePDF3Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSavePDF3', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitSavePDF', 17100001, 20260326, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webSavePDF', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   SavePDF4Static
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_CREATEPDF_005
     * @tc.desc   get createPdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SavePDF4Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSavePDF4', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitSavePDF', true, 20260327, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webSavePDF', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   SavePDF5Static
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_CREATEPDF_006
     * @tc.desc   get createPdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SavePDF5Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSavePDF5', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitSavePDF', true, 20260328, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webSavePDF', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   SavePDF6Static
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_CREATEPDF_007
     * @tc.desc   get createPdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SavePDF6Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSavePDF6', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitSavePDF', 17100001, 20260329, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webSavePDF', 10, '');
      await Utils.msSleep(6000);
      done();
    })
    /**
    * @tc.number       SUB_WEB_SWITCH_NEXT_PAGE
    * @tc.name         SwitchNextPageStatic
    * @tc.desc         test SwitchNextPageStatic
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 0
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webSavePDF', 10, '');
        await Utils.msSleep(3000);
        done()
      })
  })
}
