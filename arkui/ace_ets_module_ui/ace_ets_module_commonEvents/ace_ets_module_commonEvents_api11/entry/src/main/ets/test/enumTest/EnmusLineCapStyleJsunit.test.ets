/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function enumsLineCapStyleJsunit() {
  describe('enumsLineCapStyle', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info('beforeEach ===================enumsLineCapStyle test beforeEach called===================');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/enum/enumsLineCapStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('beforeEach get enumsLineCapStyleTest state pages:' + JSON.stringify(pages));
        if (!('enumsLineCapStyle' == pages.name)) {
          console.info('beforeEach get enumsLineCapStyleTest state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('beforeEach push enumsLineCapStyleTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('beforeEach push enumsLineCapStyleTest page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('[ afterEach ] ===================enumsImageTest test after each called===================');
    });

    /**
     * @tc.name   enumsLineCapStyleTest_0100
     * @tc.number enumsLineCapStyleTest_0100
     * @tc.desc   enumsLineCapStyleTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('enumsLineCapStyleTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('enumsLineCapStyleTest_0100 START');
      let strJson: string = getInspectorByKey('Butt');
      console.info("enumsLineCapStyleTest_0100 component strJson:" + strJson);
      console.info("enumsLineCapStyleTest_0100 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info('obj.$attrs.strokeLineCap' + JSON.parse(strJson).$attrs.strokeLineCap)
      expect(JSON.parse(strJson).$attrs.strokeLineCap).assertEqual('LineCapStyle.Butt');
      console.info('enumsLineCapStyleTest_0100 END');
      done();
    });
  })
}
