/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver,ON } from '@ohos.UiTest';

export default function BindControllerTest() {

  describe('BindControllerTest', () => {

    let PAGE_TAG = 'BindController';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`BindController/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_ETS_BIND_CONTROLLER_0100
    * @tc.name       : testBindController001
    * @tc.desc       : test Text ErrorCode 100021
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testBindController001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      let TextErrorButton100021 = await driver.findComponent(ON.id('TestErrorCodeText'))
      await Utils.sleep(500)
      await TextErrorButton100021.click()
      await Utils.sleep(500)
      expect(''+AppStorage.get('TextErrorStr100021')).assertEqual('100021');
      AppStorage.delete('TextErrorStr100021')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_ETS_BIND_CONTROLLER_0200
    * @tc.name       : testBindController002
    * @tc.desc       : test TextInput ErrorCode 100021
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testBindController002', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      let TextInputErrorButton100021 = await driver.findComponent(ON.id('TestErrorCodeTextInput'))
      await Utils.sleep(500)
      await TextInputErrorButton100021.click()
      await Utils.sleep(500)
      expect(''+AppStorage.get('TextInputErrorStr100021')).assertEqual('100021');
      AppStorage.delete('TextInputErrorStr100021')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_ETS_BIND_CONTROLLER_0300
    * @tc.name       : testBindController003
    * @tc.desc       : test TextArea ErrorCode 100021
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testBindController003', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      let TextAreaErrorButton100021 = await driver.findComponent(ON.id('TestErrorCodeTextArea'))
      await Utils.sleep(500)
      await TextAreaErrorButton100021.click()
      await Utils.sleep(500)
      expect(''+AppStorage.get('TextAreaErrorStr100021')).assertEqual('100021');
      AppStorage.delete('TextAreaErrorStr100021')
      done()
    })

  })
}