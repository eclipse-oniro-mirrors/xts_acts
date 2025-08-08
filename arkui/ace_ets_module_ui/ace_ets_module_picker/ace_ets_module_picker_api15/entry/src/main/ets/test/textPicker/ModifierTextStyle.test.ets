/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function ModifierTextStyleTest() {
  describe('ModifierTextStyleTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/modifierTextStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ModifierTextStyleTest state success ' + JSON.stringify(pages));
        if (!('modifierTextStyle' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push ModifierTextStyleTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ModifierTextStyleTest page error ' + JSON.stringify(err));
      }
      done()
    });
    /* *
    * @tc.number: ModifierTextStyleTest_0100
    * @tc.name  : ModifierTextStyleTest_0100
    * @tc.desc  : To test the minFontSize > maxFontSize, overflow = TextOverflow.Ellipsis
    * @tc.level : Level 1
    * @tc.type
    * @tc.size
    */
    it('ModifierTextStyleTest_0100', 0, async (done: Function) => {
      console.info('ModifierTextStyleTest_0100 start');
      let strJson = getInspectorByKey('modifierDefaultTextStyle');
      console.info('[ModifierTextStyleTest_0100]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ModifierTextStyleTest_0100 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[ModifierTextStyleTest_0100 obj $attrs.defaultTextStyle]:' +
      JSON.stringify(obj.$attrs.defaultTextStyle));
      expect(obj.$attrs.defaultTextStyle.minFontSize).assertEqual('28.00fp');
      expect(obj.$attrs.defaultTextStyle.maxFontSize).assertEqual('18.00fp');
      expect(obj.$attrs.defaultTextStyle.overflow).assertEqual('TextOverflow.Ellipsis');
      await CommonFunc.sleep(1000);
      console.info('[ModifierTextStyleTest_0100] END');
      done();
    });
  })
}
