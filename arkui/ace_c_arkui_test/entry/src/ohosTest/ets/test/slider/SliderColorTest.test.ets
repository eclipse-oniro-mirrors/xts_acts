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

import { beforeEach, describe, expect, it,Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import { resourceManager } from '@kit.LocalizationKit';


function spliceColor(sysColor: Resource) {
  let resourceColor = getContext().resourceManager.getColorSync(sysColor.id)
  let newArgb: string = '#' + resourceColor.toString(16).toUpperCase()
  return newArgb;
}


export default function sliderSelectedColorTest() {

  describe('SliderColorTest', () => {

    let PAGE_TAG = 'SliderColorTest';
    beforeEach(async (done: Function) => {
      await Utils.pushPage(`slider/${PAGE_TAG}`, done);
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSliderColor001
     * @tc.number SUB_ARKUI_CAPI_SLIDER_SELECTEDCOLOR_0100
     * @tc.desc   testing selectedColor for slider with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSliderColor001', Level.LEVEL1, async (done: Function) => {
      console.info('testSliderColor001  START');
      await Utils.sleep(500);
      let strJson = getInspectorByKey('sliderId');
      console.info('testSliderColor001 strJson:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info("testSliderColor001 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("testSliderColor001 component obj.$attrs.selectedColor is: " + JSON.stringify(obj.$attrs.selectedColor));
      console.info("testSliderColor001 component sys  selectedColor  is: " + spliceColor($r('sys.color.ohos_id_color_emphasize')));
      expect(obj.$attrs.selectedColor).assertEqual(spliceColor($r('sys.color.ohos_id_color_emphasize')))
      done()
    })

  })
}