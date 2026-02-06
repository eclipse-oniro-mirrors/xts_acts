/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import { UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';

export default function APIClipMaskShape() {
  describe('APIClipMaskShape', () => {
    beforeEach(async (done: Function) => {
      console.info('APIClipMaskShape beforeEach start');
      try {
        router.clear();
        let pages = router.getState();
        console.info('get APIClipMaskShape state pages:' + JSON.stringify(pages));
        if (!('APIClipMaskShape' == pages.name)) {
          console.info('get  Context pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Image/APIClipMaskShape'
          })
          await CommonFunc.sleep(2000);
          console.info('push APIClipMaskShape page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push APIClipMaskShape page error:' + err);
      }
      console.info('APIClipMaskShape foreEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('APIClipMaskShape after each called');
    });

    /**
     * @tc.name   APIClipMaskShape_001
     * @tc.number APIClipMaskShape_001
     * @tc.desc   APIClipMaskShape_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIClipMaskShape_001', Level.LEVEL0, async (done: Function) => {
      console.info('[APIClipMaskShape_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APIClipMaskShape_Image1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[APIClipMaskShape_001] component obj is: ' + JSON.stringify(obj));
      console.info('[APIClipMaskShape_001] component obj attrs is: ' + 'width' + obj.$attrs.width + 'height:' + obj.$attrs.height);
      // 会返回500.00px
      await CommonFunc.sleep(1000);
      let width = obj.$attrs.width.slice(0, -5) + 'px'
      let height = obj.$attrs.height.slice(0, -5) + 'px'
      expect(width).assertEqual('500px');
      expect(height).assertEqual('280px');
      console.info('[APIClipMaskShape_001] END');
      done();
    });

    /**
     * @tc.name   APIClipMaskShape_002
     * @tc.number APIClipMaskShape_002
     * @tc.desc   APIClipMaskShape_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIClipMaskShape_002', Level.LEVEL0, async (done: Function) => {
      console.info('[APIClipMaskShape_002] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APIClipMaskShape_Image2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[APIClipMaskShape_002] component obj is: ' + JSON.stringify(obj));
      console.info('[APIClipMaskShape_002] component obj attrs is: ' + 'width' + obj.$attrs.width + 'height:' + obj.$attrs.height);
      await CommonFunc.sleep(1000);
      let width = obj.$attrs.width.slice(0, -5) + 'px'
      let height = obj.$attrs.height.slice(0, -5) + 'px'
      expect(width).assertEqual('300px');
      expect(height).assertEqual('300px');
      console.info('[APIClipMaskShape_002] END');
      done();
    });
  })
}
