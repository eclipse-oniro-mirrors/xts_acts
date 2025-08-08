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
import { describe, beforeEach, afterEach, it, expect,beforeAll } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function fontWeightJsunit() {
  describe('panDirectionTest', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/panDirection',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get panDirection state success " + JSON.stringify(pages));
        if (!("panDirection" == pages.name)) {
          console.info("get panDirection state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(3000);
          console.info("push panDirection page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push panDirection page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("panDirection after each called");
    });

    it('panDirectionText_0100', 0, async (done: Function) => {
      console.info('panDirectionText_0100 START');
      let strJson: string = getInspectorByKey('panDirection');
      console.info("panDirectionText_0100 component strJson:" + strJson);
      console.info("panDirectionText_0100 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      done();
    });

  })
}