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

export default function textInputOnChangeTest() {

  describe('TextInputOnChangeTest', () => {

    let PAGE_TAG = 'TextInputOnChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textinput/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_ONCHANGE_0100
    * @tc.name       : testTextInputOnChange001
    * @tc.desc       : testing onChange event callback for textInput
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextInputOnChange001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnChangeTextInput')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnChangeTextInput').$attrs.backgroundColor).assertEqual('#FF0000FF')
      done();
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_ONCHANGE_0200
    * @tc.name       : testTextInputOnChange002
    * @tc.desc       : testing onChange event not callback for textInput
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextInputOnChange002', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnChangeTextInputDisabled');
      await Utils.sleep(1000);
      expect(Utils.getComponentInfoByKey('OnChangeTextInputDisabled').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done();
    });
  })
}
