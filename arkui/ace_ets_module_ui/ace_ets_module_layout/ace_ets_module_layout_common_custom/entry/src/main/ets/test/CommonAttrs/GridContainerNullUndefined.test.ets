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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function GridContainerNullUndefinedTest() {
  describe('GridContainerNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("GridContainerNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/GridContainerNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridContainerNullUndefined state success " + JSON.stringify(pages));
        if (!("GridContainerNullUndefined" == pages.name)) {
          console.info("get GridContainerNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridContainerNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridContainerNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   GridContainerNullUndefinedTest_0100
     * @tc.number GridContainerNullUndefinedTest_0100
     * @tc.desc   test gridSpan with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridContainerNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('GridContainerNullUndefinedTest_0100 START');

      let strJson = getInspectorByKey('GridContainerNullUndefinedTest_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[GridContainerNullUndefinedTest_0100] obj.$attrs.gridSpan:' + obj.$attrs.gridSpan);
      expect(obj.$attrs.gridSpan).assertEqual(1);
      console.info('GridContainerNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   GridContainerNullUndefinedTest_0200
     * @tc.number GridContainerNullUndefinedTest_0200
     * @tc.desc   test gridSpan with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridContainerNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('GridContainerNullUndefinedTest_0200 START');

      let strJson = getInspectorByKey('GridContainerNullUndefinedTest_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[GridContainerNullUndefinedTest_0200] obj.$attrs.gridSpan:' + obj.$attrs.gridSpan);
      expect(obj.$attrs.gridSpan).assertEqual(1);
      console.info('GridContainerNullUndefinedTest_0200 END');
      done();
    });

    /**
     * @tc.name   GridContainerNullUndefinedTest_0300
     * @tc.number GridContainerNullUndefinedTest_0300
     * @tc.desc   test gridOffset with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridContainerNullUndefinedTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('GridContainerNullUndefinedTest_0300 START');

      let strJson = getInspectorByKey('GridContainerNullUndefinedTest_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[GridContainerNullUndefinedTest_0300] obj.$attrs.gridOffset:' + obj.$attrs.gridOffset);
      expect(obj.$attrs.gridOffset).assertEqual(0);
      console.info('GridContainerNullUndefinedTest_0300 END');
      done();
    });

    /**
     * @tc.name   GridContainerNullUndefinedTest_0400
     * @tc.number GridContainerNullUndefinedTest_0400
     * @tc.desc   test gridOffset with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GridContainerNullUndefinedTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('GridContainerNullUndefinedTest_0400 START');

      let strJson = getInspectorByKey('GridContainerNullUndefinedTest_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[GridContainerNullUndefinedTest_0400] obj.$attrs.gridOffset:' + obj.$attrs.gridOffset);
      expect(obj.$attrs.gridOffset).assertEqual(0);
      console.info('GridContainerNullUndefinedTest_0400 END');
      done();
    });
  })
}

