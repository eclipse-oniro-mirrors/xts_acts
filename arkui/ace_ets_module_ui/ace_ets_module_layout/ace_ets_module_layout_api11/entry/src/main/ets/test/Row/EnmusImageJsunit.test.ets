/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../Utils';

export default function enumsImageJsunit() {
  describe('enumsImage', () => {
    beforeEach(async (done: Function) => {
      console.info('beforeEach ===================enumsImage test beforeEach called===================');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/enumsImage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('beforeEach get enumsImage state pages:' + JSON.stringify(pages));
        if (!('enumsFlexItem' == pages.name)) {
          console.info('beforeEach get enumsItemAlign state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('beforeEach push enumsImageTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('beforeEach push enumsImageTest page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('[ afterEach ] ===================enumsImageTest test after each called===================');
    });

    it('enumsImageTest_0100', 0, async (done: Function) => {
      console.info('enumsImageTest_0100 START');
      let strJson: string = getInspectorByKey('Image');
      console.info("enumsImageTest_0100 component strJson:" + strJson);
      console.info("enumsImageTest_0100 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.backgroundImageSize).assertEqual('ImageSize.Auto');
      console.info('enumsImageTest_0100 END');
      done();
    });

    it('enumsImageTest_0200', 0, async (done: Function) => {
      console.info('enumsImageTest_0200 START');
      let strJson: string = getInspectorByKey('Image');
      console.info("enumsImageTest_0200 component strJson:" + strJson);
      console.info("enumsImageTest_0200 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("enumsImageTest_0200 component obj1 is: " + JSON.parse(strJson).$attrs.backgroundImage.split(', ')[1]);
      expect(JSON.parse(strJson).$attrs.backgroundImage.split(', ')[1]).assertEqual('ImageRepeat.Y');
      console.info('enumsImageTest_0200 END');
      done();
    });
  })
}
