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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';;

export default function refreshJsunit() {
  describe('refreshTest', () => {
    beforeEach(async (done: Function) => {
      console.info("refresh beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refresh',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get refresh state pages:" + JSON.stringify(pages));
        if (!("refresh" == pages.name)) {
          console.info("get refresh state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push refresh page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push refresh page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("refresh after each called");
    });

    it('testRefresh01', 0, async (done: Function) => {
      console.info('[testRefresh01] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('refresh');
      console.info('[testRefresh01 strJson]' + strJson);
      console.info('[testRefresh01] END');
      done();
    });

    it('testRefresh02', 0, async (done: Function) => {
      console.info('[testRefresh02] START');
      expect(RefreshStatus.OverDrag).assertEqual(2);
      console.info('[testRefresh02] END');
      done();
    });

    it('testRefresh03', 0, async (done: Function) => {
      console.info('[testRefresh03] START');
      expect(RefreshStatus.Inactive).assertEqual(0);
      console.info('[testRefresh03] END');
      done();
    });
  });
}
