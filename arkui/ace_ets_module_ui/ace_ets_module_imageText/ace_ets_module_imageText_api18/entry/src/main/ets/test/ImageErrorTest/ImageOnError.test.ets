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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function ImageOnErrorTest() {
  describe('ImageOnErrorTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageOnErrorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageError/ImageOnError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageOnErrorTest state pages:' + JSON.stringify(pages));
        if (!('ImageOnError' == pages.name)) {
          console.info('get ImageOnErrorTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push ImageOnErrorTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageOnErrorTest page error:' + err);
      }
      console.info('ImageOnErrorTest beforeEach end');
      done();
    });
    /**
     * @tc.name   ImageOnErrorTest_001
     * @tc.number ImageOnErrorTest_001
     * @tc.desc   To test the ImageOnError componentWidth componentHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOnErrorTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('ImageOnErrorTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('image');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('componentWidth');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[ImageOnErrorTest_001] obj1.$attrs.content is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[ImageOnErrorTest_001] px2vp(obj1.$attrs.content) is: " + px2vp(parseFloat(obj1.$attrs.content)));
      let componentWidth = Math.round(px2vp(parseFloat(obj1.$attrs.content))) + '.00vp'
      expect(obj.$attrs.width).assertEqual(componentWidth);

      let strJson2 = getInspectorByKey('componentHeight');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[ImageOnErrorTest_001] obj2.$attrs.content is: " + JSON.stringify(obj2.$attrs.content));
      let componentHeight = Math.round(px2vp(parseFloat(obj2.$attrs.content))) + '.00vp'
      expect(obj.$attrs.height).assertEqual(componentHeight);
      console.info('[ImageOnErrorTest_001] END');
      done();
    });
  })
}
