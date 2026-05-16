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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, afterEach } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext: common.UIAbilityContext;

let emitKey = 'emitLoadUrl';

export default function webJsunit() {
  describe('createPdfTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   SavePDFStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_CREATEPDF_001
     * @tc.desc   get createPdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SavePDFStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = 'emitSavePDF';
      Utils.emitEvent(emitKey, 10)
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
      emitKey = 'emitSavePDF1';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('emitSavePDF', true, 20241128, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webSavePDF', 10, '');
      await Utils.msSleep(6000);
      done();
    })


  })
}


