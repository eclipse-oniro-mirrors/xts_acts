/**
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function ImageLoadResultTest() {
  describe('ImageLoadResultTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageLoadResultTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageSpan/ImageLoadResult',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageLoadResultTest state pages: " + JSON.stringify(pages));
        if (!("ImageLoadResult" == pages.name)) {
          console.info("get ImageLoadResultTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageLoadResultTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageLoadResultTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ImageLoadResultTest_0010
     * @tc.number SUB_ACE_ImageLoadResultTest_0010
     * @tc.desc   test ImageSpan ImageLoadResult: width and height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageLoadResultTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('ImageLoadResultTest_0010 START');
      await CommonFunc.sleep(500);
      console.info("[ImageLoadResultTest_0010] width:" + JSON.stringify(AppStorage.get('ImageLoadResult.width')));
      console.info("[ImageLoadResultTest_0010] height:" + JSON.stringify(AppStorage.get('ImageLoadResult.height')));
      expect(AppStorage.get('ImageLoadResult.width')).assertEqual(AppStorage.get('ImageLoadResult.height'));
      AppStorage.delete('ImageLoadResult.width')
      AppStorage.delete('ImageLoadResult.height')
      console.info('[ImageLoadResultTest_0010] END');
      done();
    });

    /**
     * @tc.name   ImageLoadResultTest_0020
     * @tc.number SUB_ACE_ImageLoadResultTest_0020
     * @tc.desc   test ImageSpan ImageLoadResult: componentWidth and componentHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageLoadResultTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageLoadResultTest_0020] START');
      await CommonFunc.sleep(500);
      console.info("[ImageLoadResultTest_0020] componentWidth:"
        + JSON.stringify(AppStorage.get('ImageLoadResult.componentWidth')));
      console.info("[ImageLoadResultTest_0020] componentHeight:"
        + JSON.stringify(AppStorage.get('ImageLoadResult.componentHeight')));
      expect(AppStorage.get('ImageLoadResult.componentWidth')).assertEqual(AppStorage.get('ImageLoadResult.componentHeight'));
      AppStorage.delete('ImageLoadResult.componentWidth')
      AppStorage.delete('ImageLoadResult.componentHeight')
      console.info('[ImageLoadResultTest_0020] END');
      done();
    });
  })
}
