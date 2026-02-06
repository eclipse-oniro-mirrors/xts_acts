/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function backgroundImageOption() {
  describe('backgroundImageOption', () => {
    beforeEach(async (done: Function) => {
      console.info('backgroundImageOption beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/background/backgroundImageOption',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get backgroundImageOption state pages: ' + JSON.stringify(pages));
        if (!('backgroundImageOption' == pages.name)) {
          console.info('get backgroundImageOption state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push backgroundImageOption success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push backgroundImageOption page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   backgroundImageOption_0100
     * @tc.number backgroundImageOption_0100
     * @tc.desc   api: backgroundImage Option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('backgroundImageOption_0100', Level.LEVEL2, async (done: Function) => {
      console.info('backgroundImageOption_0100 START');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = getInspectorTree();
      let backgroundImage1 = JSON.stringify(obj1?.$children[0]?.$children[0]?.$children[0]?.$attrs.backgroundImage)
      let backgroundImage2 = JSON.stringify(obj1?.$children[0]?.$children[0]?.$children[1]?.$attrs.backgroundImage)
      let backgroundImage3 = JSON.stringify(obj1?.$children[0]?.$children[0]?.$children[2]?.$attrs.backgroundImage)
      let backgroundImage4 = JSON.stringify(obj1?.$children[0]?.$children[0]?.$children[3]?.$attrs.backgroundImage)
      console.log('backgroundImageOption_0100 children0 : ', backgroundImage1)
      console.log('backgroundImageOption_0100 children1 : ', backgroundImage2)
      console.log('backgroundImageOption_0100 children2 : ', backgroundImage3)
      console.log('backgroundImageOption_0100 children3 : ', backgroundImage4)
      await CommonFunc.sleep(1000);
      expect(backgroundImage1).assertEqual('", ImageRepeat.XY"');
      expect(backgroundImage2).assertEqual('"resource:///16777238.png, ImageRepeat.Y"'); 
      expect(backgroundImage3).assertEqual('"resource:///16777238.png, ImageRepeat.X"');
      expect(backgroundImage4).assertEqual('"resource:///16777238.png, ImageRepeat.NoRepeat"');
      console.info('backgroundImageOption_0100 END');
      done();
    });
  })
}
