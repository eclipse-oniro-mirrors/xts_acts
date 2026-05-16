/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';

export default function QueryNavDestinationInfoTest() {
  describe('QueryNavDestinationInfoTest', () => {
    beforeEach(async (done: Function) => {
      console.info('QueryNavDestinationInfoTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedTest/QueryNavDestinationInfoTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get QueryNavDestinationInfoTest state pages: ' + JSON.stringify(pages));
        if (!('QueryNavDestinationInfoTest' == pages.name)) {
          console.info('get QueryNavDestinationInfoTest  state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(3000);
          console.info('push QueryNavDestinationInfoTest  success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push QueryNavDestinationInfoTest page error:' + err);
      }
      console.info('QueryNavDestinationInfoTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('QueryNavDestinationInfoTest after each called');
    });

    /**
     * @tc.name   queryNavDestinationInfoNull_0100
     * @tc.number SUB_ARKUI_QUERY_NAV_DESTINATION_INFO_NULL_0100
     * @tc.desc   测试queryNavDestinationInfo接口传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('queryNavDestinationInfoNull_0100', Level.LEVEL0, async () => {
      console.info('[queryNavDestinationInfoNull_0100] START');

      let strJson: string = getInspectorByKey('queryNavDestinationInfo_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[queryNavDestinationInfoNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs !== undefined).assertTrue();
      console.info('[queryNavDestinationInfoNull_0100] END');
    });

    /**
     * @tc.name   queryNavDestinationInfoUndefined_0100
     * @tc.number SUB_ARKUI_QUERY_NAV_DESTINATION_INFO_UNDEFINED_0100
     * @tc.desc   测试queryNavDestinationInfo接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('queryNavDestinationInfoUndefined_0100', Level.LEVEL0, async () => {
      console.info('[queryNavDestinationInfoUndefined_0100] START');

      let strJson: string = getInspectorByKey('queryNavDestinationInfo_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[queryNavDestinationInfoUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs !== undefined).assertTrue();
      console.info('[queryNavDestinationInfoUndefined_0100] END');
    });
  });
}