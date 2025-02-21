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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function textInputEnabledTest() {

  describe('TextInputEnabledTest', () => {

    let PAGE_TAG = 'TextInputEnabledTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textinput/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_ENABLED_0100
    * @tc.name       : testTextInputEnabled001
    * @tc.desc       : testing enabled event callback for textInput with normal value (1)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextInputEnabled001', 0, async (done: Function) => {
      await Utils.clickComponent('OnClickEnabledTextInput')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledTextInput').$attrs.backgroundColor).assertEqual('#FFFFFF00')

      focusControl.requestFocus('OnClickAbnormalTextInput')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledTextInput').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickEnabledTextInput').$attrs.enabled).assertTrue()

      focusControl.requestFocus('OnClickEnabledTextInput')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledTextInput').$attrs.backgroundColor).assertEqual('#FF0000FF')
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_ENABLED_0200
    * @tc.name       : testTextInputEnabled002
    * @tc.desc       : testing enabled event callback for textInput with normal value (0)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextInputEnabled002', 0, async (done: Function) => {
      await Utils.clickComponent('OnClickDisabledTextInput')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledTextInput').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('OnClickEnabledTextInput')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledTextInput').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnClickDisabledTextInput').$attrs.enabled).assertFalse()

      focusControl.requestFocus('OnClickDisabledTextInput')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledTextInput').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_ENABLED_0300
    * @tc.name       : testTextInputEnabled003
    * @tc.desc       : testing enabled event callback for textInput with abnormal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testTextInputEnabled003', 0, async (done: Function) => {
      await Utils.clickComponent('OnClickAbnormalTextInput')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalTextInput').$attrs.backgroundColor).assertEqual('#FFFFFF00')

      focusControl.requestFocus('OnClickEnabledTextInput')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalTextInput').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickAbnormalTextInput').$attrs.enabled).assertTrue()

      focusControl.requestFocus('OnClickAbnormalTextInput')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalTextInput').$attrs.backgroundColor).assertEqual('#FF0000FF')
      done();
    })

  })
}
