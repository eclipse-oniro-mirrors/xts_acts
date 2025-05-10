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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextDataDetectorConfig() {
  describe('TextDataDetectorConfig', () => {
    beforeEach(async (done: Function) => {
      console.info("TextDataDetectorConfig beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextDataDetectorConfig',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextDataDetectorConfig state pages:" + JSON.stringify(pages));
        if (!("TextDataDetectorConfig" == pages.name)) {
          console.info("get TextDataDetectorConfig pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextDataDetectorConfig page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextDataDetectorConfig page error:" + err);
      }
      console.info("TextDataDetectorConfig beforeEach end");
      done();
    });

    /**
     * @tc.number: TextDataDetectorConfig_0010
     * @tc.name  : TextDataDetectorConfig_0010
     * @tc.desc  : set Text: TextDataDetectorConfig
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextDataDetectorConfig_0010', 0, async (done: Function) => {
      console.info('TextDataDetectorConfig_0010 START');
      let TextDataDetectorConfig_1 = getInspectorByKey('text_dataDetectorConfig');
      expect(""+JSON.parse(JSON.parse(TextDataDetectorConfig_1).$attrs.dataDetectorConfig).color).assertEqual('#FF0000FF');
      console.info('TextDataDetectorConfig_0010 END');
      done();
    });
	
	/**
     * @tc.number: TextDataDetectorConfig_0020
     * @tc.name  : TextDataDetectorConfig_0020
     * @tc.desc  : set Text: TextDataDetectorConfig
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextDataDetectorConfig_0020', 0, async (done: Function) => {
      console.info('TextDataDetectorConfig_0020 START');
      let TextDataDetectorConfig_1 = getInspectorByKey('text_dataDetectorConfig');
      expect(""+JSON.parse(JSON.parse(TextDataDetectorConfig_1).$attrs.dataDetectorConfig).decoration.type).assertEqual('1');
      console.info('TextDataDetectorConfig_0020 END');
      done();
    });
	
	/**
     * @tc.number: TextDataDetectorConfig_0030
     * @tc.name  : TextDataDetectorConfig_0030
     * @tc.desc  : set Text: TextDataDetectorConfig
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextDataDetectorConfig_0030', 0, async (done: Function) => {
      console.info('TextDataDetectorConfig_0030 START');
      let TextDataDetectorConfig_1 = getInspectorByKey('text_dataDetectorConfig');
      expect(""+JSON.parse(JSON.parse(TextDataDetectorConfig_1).$attrs.dataDetectorConfig).decoration.color).assertEqual('#FFFF0000');
      console.info('TextDataDetectorConfig_0030 END');
      done();
    });
	
	/**
     * @tc.number: TextDataDetectorConfig_0040
     * @tc.name  : TextDataDetectorConfig_0040
     * @tc.desc  : set Text: TextDataDetectorConfig
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextDataDetectorConfig_0040', 0, async (done: Function) => {
      console.info('TextDataDetectorConfig_0040 START');
      let TextDataDetectorConfig_1 = getInspectorByKey('text_dataDetectorConfig');
      expect(""+JSON.parse(JSON.parse(TextDataDetectorConfig_1).$attrs.dataDetectorConfig).decoration.style).assertEqual('0');
      console.info('TextDataDetectorConfig_0040 END');
      done();
    });
  })
}