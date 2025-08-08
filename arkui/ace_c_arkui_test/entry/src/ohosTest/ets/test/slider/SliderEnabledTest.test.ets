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

export default function sliderEnabledTest() {

  describe('SliderEnabledTest', () => {

    let PAGE_TAG = 'SliderEnabledTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`slider/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ENABLED_0100
    * @tc.name       : testSliderEnabled001
    * @tc.desc       : testing enabled event callback for slider with normal value (1)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSliderEnabled001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickEnabledSlider')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledSlider').$attrs.backgroundColor).assertEqual('#FF00FF00')

      focusControl.requestFocus('OnClickEnabledSlider')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledSlider').$attrs.backgroundColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('OnClickAbnormalSlider')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickEnabledSlider').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickEnabledSlider').$attrs.enabled).assertTrue()
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ENABLED_0200
    * @tc.name       : testSliderEnabled002
    * @tc.desc       : testing enabled event callback for slider with normal value (0)
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSliderEnabled002', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickDisabledSlider')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledSlider').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('OnClickDisabledSlider')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledSlider').$attrs.backgroundColor).assertEqual('#FFFF0000')

      focusControl.requestFocus('OnClickEnabledSlider')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickDisabledSlider').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnClickDisabledSlider').$attrs.enabled).assertFalse()
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SLIDER_ENABLED_0300
    * @tc.name       : testSliderEnabled003
    * @tc.desc       : testing enabled event callback for slider with abnormal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSliderEnabled003', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnClickAbnormalSlider')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalSlider').$attrs.backgroundColor).assertEqual('#FF00FF00')
      
      focusControl.requestFocus('OnClickAbnormalSlider')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalSlider').$attrs.backgroundColor).assertEqual('#FF0000FF')

      focusControl.requestFocus('OnClickEnabledSlider')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnClickAbnormalSlider').$attrs.backgroundColor).assertEqual('#FFFFFF00')
      expect(Utils.getComponentInfoByKey('OnClickAbnormalSlider').$attrs.enabled).assertTrue()
      done();
    })



  })
}
