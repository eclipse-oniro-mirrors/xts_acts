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

export default function textEnabledTest() {

  describe('TextEnabledTest', () => {

    let PAGE_TAG = 'TextEnabledTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`text/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXT_ENABLED_0100
    * @tc.name       : testTextEnabled001
    * @tc.desc       : testing enabled event callback for text with normal value (1)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextEnabled001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickEnabledText')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledText').$attrs.backgroundColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('OnClickAbnormalText')
      focusControl.requestFocus('OnClickEnabledText')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledText').$attrs.backgroundColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('OnClickAbnormalText')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledText').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickEnabledText').$attrs.enabled).assertTrue()
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXT_ENABLED_0200
    * @tc.name       : testTextEnabled002
    * @tc.desc       : testing enabled event callback for text with normal value (0)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextEnabled002', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickDisabledText')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledText').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('OnClickEnabledText')
      focusControl.requestFocus('OnClickDisabledText')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledText').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('OnClickEnabledText')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledText').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnClickDisabledText').$attrs.enabled).assertFalse()
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXT_ENABLED_0300
    * @tc.name       : testTextEnabled003
    * @tc.desc       : testing enabled event callback for text with abnormal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testTextEnabled003', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickAbnormalText')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalText').$attrs.backgroundColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('OnClickEnabledText')
      focusControl.requestFocus('OnClickAbnormalText')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalText').$attrs.backgroundColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('OnClickEnabledText')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalText').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickAbnormalText').$attrs.enabled).assertTrue()
      done();
    })
  })
}
