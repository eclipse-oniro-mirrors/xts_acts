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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function FontSettingOptions() {
  describe('FontSettingOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("FontSettingOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/FontSettingOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FontSettingOptions state pages:" + JSON.stringify(pages));
        if (!("FontSettingOptions" == pages.name)) {
          console.info("get FontSettingOptions pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FontSettingOptions page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FontSettingOptions page error:" + err);
      }
      console.info("FontSettingOptions beforeEach end");
      done();
    });

    /**
     * @tc.number: FontSettingOptions_0010
     * @tc.name  : FontSettingOptions_0010
     * @tc.desc  : set Text: FontSettingOptions
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('FontSettingOptions_0010',  Level.LEVEL0, async (done: Function) => {
      console.info('FontSettingOptions_0010 START');
      let FontSettingOptions_1 = getInspectorByKey('FontTestText_01');
      console.info('--------------'+JSON.parse(FontSettingOptions_1).$attrs.font)
      expect(""+JSON.parse(FontSettingOptions_1).$type).assertEqual('Text');
      console.info('FontSettingOptions_0010 END');
      done();
    });
	
	/**
     * @tc.number: FontSettingOptions_0020
     * @tc.name  : FontSettingOptions_0020
     * @tc.desc  : set Text: FontSettingOptions
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('FontSettingOptions_0020',  Level.LEVEL0, async (done: Function) => {
      console.info('FontSettingOptions_0020 START');
      let FontSettingOptions_2 = getInspectorByKey('FontTestText_02');
      console.info('--------------'+JSON.parse(FontSettingOptions_2).$attrs.fontWeight)
      expect(""+JSON.parse(FontSettingOptions_2).$type).assertEqual('Text');
      console.info('FontSettingOptions_0020 END');
      done();
    });
  })
}