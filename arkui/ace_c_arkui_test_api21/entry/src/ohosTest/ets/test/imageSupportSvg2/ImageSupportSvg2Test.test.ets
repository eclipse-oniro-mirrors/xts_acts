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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType} from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';

export default function ImageSupportSvg2Test(){
  describe('ImageSupportSvg2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageSupportSvg2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageSupportSvg2/ImageSupportSvg2Page',
     }
     try {
       router.clear();
       let pages = router.getState();
       console.info("get ImageSupportSvg2Test state pages:" + JSON.stringify(pages));
       if (!("ImageSupportSvg2Page" == pages.name)) {
         console.info("get ImageSupportSvg2Test pages.name:" + JSON.stringify(pages.name));
         let result = await router.pushUrl(options);
         await Utils.sleep(2000);
         console.info("push ImageSupportSvg2Test page result:" + JSON.stringify(result));
         }
     } catch (err) {
       console.error("push ImageSupportSvg2Test page error:" + err);
     }
     console.info("ImageSupportSvg2Test beforeEach end");
     done();
    });
    
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number    ImageSupportSvg2Test_0100
     * @tc.name      ImageSupportSvg2Test0100
     * @tc.desc    : testing image supportSvg2 interface: set 'true' value，expect 'true' value
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ImageSupportSvg2Test0100', TestType.FUNCTION | Level.LEVEL1, async (done: Function) => {
      console.info('[ImageSupportSvg2Test0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.supportSvg2).assertEqual('true');
      console.info('[ImageSupportSvg2Test0100] END');
      done();  
    });

    /**
     * @tc.number    ImageSupportSvg2Test_0200
     * @tc.name      ImageSupportSvg2Test0200
     * @tc.desc    : testing image supportSvg2 interface: set 'false' value，expect 'false' value
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ImageSupportSvg2Test0200', TestType.FUNCTION | Level.LEVEL1, async (done: Function) => {
      console.info('[ImageSupportSvg2Test0200] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('image2');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.supportSvg2).assertEqual('false');
      console.info('[ImageSupportSvg2Test0200] END');
      done();  
    });

    /**
     * @tc.number    ImageSupportSvg2Test_0300
     * @tc.name      ImageSupportSvg2Test0300
     * @tc.desc    : testing image supportSvg2 interface: not set value，expect default('false') value
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('ImageSupportSvg2Test0300', TestType.FUNCTION | Level.LEVEL1, async (done: Function) => {
      console.info('[ImageSupportSvg2Test0300] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('image3');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.supportSvg2).assertEqual('false');
      console.info('[ImageSupportSvg2Test0300] END');
      done();  
    });
})
}