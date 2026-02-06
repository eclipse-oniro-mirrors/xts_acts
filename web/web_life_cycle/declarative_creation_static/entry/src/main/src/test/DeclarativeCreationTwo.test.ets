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

import { expect, beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import { startAbility, Utils } from './Util.test';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';


export default function declarativeCreationTwo() {

  describe('declarativeCreationOne', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    afterEach(async () => {
      await Utils.msSleep(2000);
      console.info('declarativeCreationOne afterEach end');
    })

    /**
    * @tc.number     SUB_WEB_SETWEBCONTROLLER_0200
    * @tc.name       testSetWebControllerStatic
    * @tc.desc       test setWebController
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testSetWebControllerStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.weblifecycletwo.test.static', 'EntryAbility');
      await Utils.msSleep(9000);
      console.info('Finish startAbility')

      Utils.emitEvent("emitSetWebControllerTest", 10)
      Utils.registerEvent("testSetWebControllerStatic", true, 1320, done);
      inspector.sendEventByKey('buttonSetWebController', 10, '');

      let openBtn = await driver.findComponent(ON.text('试一试'))
      expect(openBtn != null).assertTrue();
      if (openBtn != null) {
        await openBtn.click();
        await Utils.msSleep(2000);
      }
      inspector.sendEventByKey('buttonSetWebController', 10, '');

      await Utils.msSleep(5000);
      done();
    })
  })
}
