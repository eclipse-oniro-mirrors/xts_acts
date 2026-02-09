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
import { ComponentInfo } from '../common/Interfaces';
import Utils from '../common/Utils';

export default function toggleEnabledTest() {

  describe('ToggleEnabledTest', () => {

    let PAGE_TAG = 'ToggleEnabledTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`toggle/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testToggleEnabled001
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ENABLED_0100
     * @tc.desc   testing enabled event callback for toggle with normal value (true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleEnabled001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickEnabledToggle')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledToggle').$attrs.switchPointColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('OnClickAbnormalToggle')
      focusControl.requestFocus('OnClickEnabledToggle')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledToggle').$attrs.switchPointColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('OnClickAbnormalToggle')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledToggle').$attrs.switchPointColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickEnabledToggle').$attrs.enabled).assertTrue()
      done();
    })

    /**
     * @tc.name   testToggleEnabled002
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ENABLED_0200
     * @tc.desc   testing enabled event callback for toggle with normal value (false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleEnabled002', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickDisabledToggle')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledToggle').$attrs.switchPointColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('OnClickEnabledToggle')
      focusControl.requestFocus('OnClickDisabledToggle')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledToggle').$attrs.switchPointColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('OnClickEnabledToggle')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledToggle').$attrs.switchPointColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnClickDisabledToggle').$attrs.enabled).assertFalse()
      done();
    })

    /**
     * @tc.name   testToggleEnabled003
     * @tc.number SUB_ARKUI_CAPI_TOGGLE_ENABLED_0300
     * @tc.desc   testing enabled event callback for toggle with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToggleEnabled003', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickAbnormalToggle')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalToggle').$attrs.switchPointColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('OnClickEnabledToggle')
      focusControl.requestFocus('OnClickAbnormalToggle')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalToggle').$attrs.switchPointColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('OnClickEnabledToggle')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalToggle').$attrs.switchPointColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickAbnormalToggle').$attrs.enabled).assertTrue()
      done();
    })
  })
}
