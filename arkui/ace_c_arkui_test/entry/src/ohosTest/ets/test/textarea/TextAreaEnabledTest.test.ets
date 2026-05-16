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

export default function textAreaEnabledTest() {

  describe('TextAreaEnabledTest', () => {

    let PAGE_TAG = 'TextAreaEnabledTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textarea/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testTextAreaEnabled001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_ENABLED_0100
     * @tc.desc   testing enabled event callback for textarea with normal value (1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaEnabled001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickEnabledTextarea')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledTextarea').$attrs.backgroundColor).assertEqual('#FFFFFF00')

      focusControl.requestFocus('OnClickAbnormalTextarea')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledTextarea').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickEnabledTextarea').$attrs.enabled).assertTrue()

      focusControl.requestFocus('OnClickEnabledTextarea')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledTextarea').$attrs.backgroundColor).assertEqual('#FF0000FF')
      done();
    })

    /**
     * @tc.name   testTextAreaEnabled002
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_ENABLED_0200
     * @tc.desc   testing enabled event callback for textarea with normal value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaEnabled002', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickDisabledTextarea')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledTextarea').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('OnClickEnabledTextarea')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledTextarea').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnClickDisabledTextarea').$attrs.enabled).assertFalse()

      focusControl.requestFocus('OnClickDisabledTextarea')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledTextarea').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done();
    })

    /**
     * @tc.name   testTextAreaEnabled003
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_ENABLED_0300
     * @tc.desc   testing enabled event callback for textarea with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaEnabled003', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickAbnormalTextarea')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalTextarea').$attrs.backgroundColor).assertEqual('#FFFFFF00')

      focusControl.requestFocus('OnClickEnabledTextarea')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalTextarea').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickAbnormalTextarea').$attrs.enabled).assertTrue()

      focusControl.requestFocus('OnClickAbnormalTextarea')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalTextarea').$attrs.backgroundColor).assertEqual('#FF0000FF')
      done();
    })



  })
}
