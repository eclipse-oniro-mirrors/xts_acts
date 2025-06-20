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

export default function TextHalfLeading() {
  describe('TextHalfLeading', () => {
    beforeEach(async (done: Function) => {
      console.info("TextHalfLeading beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextHalfLeading',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextHalfLeading state pages:" + JSON.stringify(pages));
        if (!("TextHalfLeading" == pages.name)) {
          console.info("get TextHalfLeading pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextHalfLeading page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextHalfLeading page error:" + err);
      }
      console.info("TextHalfLeading beforeEach end");
      done();
    });

    /**
     * @tc.number: TextHalfLeading_0010
     * @tc.name  : TextHalfLeading_0010
     * @tc.desc  : set Text: TextHalfLeading
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextHalfLeading_0010',  Level.LEVEL0, async (done: Function) => {
      console.info('TextHalfLeading_0010 START');
      let TextHalfLeading_1 = getInspectorByKey('TextHalfLeading1');
      expect(""+JSON.parse(TextHalfLeading_1).$type).assertEqual('Text');
      console.info('TextHalfLeading_0010 END');
      done();
    });

    /**
     * @tc.number: TextHalfLeading_0020
     * @tc.name  : TextHalfLeading_0020
     * @tc.desc  : set Text: TextHalfLeading
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextHalfLeading_0020',  Level.LEVEL0, async (done: Function) => {
      console.info('TextHalfLeading_0020 START');
      let TextHalfLeading_2 = getInspectorByKey('TextHalfLeading2');
      expect(""+JSON.parse(TextHalfLeading_2).$type).assertEqual('Text');
      console.info('TextHalfLeading_0020 END');
      done();
    });
  })
}