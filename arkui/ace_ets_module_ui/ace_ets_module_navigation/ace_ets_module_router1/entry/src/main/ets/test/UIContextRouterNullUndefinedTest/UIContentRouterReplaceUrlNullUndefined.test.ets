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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component, Point} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common'

const SLEEP_TIME = 1500;


export default function UIContentRouterReplaceUrlNullUndefinedTest() {
  describe('UIContentRouterReplaceUrlNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContentRouterReplaceUrlNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContextRouterNullUndefined/UIContentRouterReplaceUrlNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContentRouterReplaceUrlNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("UIContentRouterReplaceUrlNullUndefined" == pages.name)) {
          console.info("get UIContentRouterReplaceUrlNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIContentRouterReplaceUrlNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContentRouterReplaceUrlNullUndefinedTest page error:" + err);
      }
      console.info("UIContentRouterReplaceUrlNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   UIContentRouterReplaceUrlNullUndefinedTest_0001
     * @tc.number UIContentRouterReplaceUrlNullUndefinedTest_0001
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterReplaceUrlNullUndefinedTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0001 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('replaceUrlUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0001 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterReplaceUrlNullUndefinedTest_0002
     * @tc.number UIContentRouterReplaceUrlNullUndefinedTest_0002
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterReplaceUrlNullUndefinedTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0002 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('replaceUrlNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0002' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0002 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterReplaceUrlNullUndefinedTest_0003
     * @tc.number UIContentRouterReplaceUrlNullUndefinedTest_0003
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterReplaceUrlNullUndefinedTest_0003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)=> {
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0003 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('replaceUrlEmpty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0003' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0003 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterReplaceUrlNullUndefinedTest_0004
     * @tc.number UIContentRouterReplaceUrlNullUndefinedTest_0004
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterReplaceUrlNullUndefinedTest_0004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)=> {
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0004 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('replaceUrlRecoverableTrue');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0004' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0004 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterReplaceUrlNullUndefinedTest_0005
     * @tc.number UIContentRouterReplaceUrlNullUndefinedTest_0005
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterReplaceUrlNullUndefinedTest_0005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)=> {
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0005 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('replaceUrlRecoverableFalse');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0005' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterReplaceUrlNullUndefinedTest_0005 END');
      done();
    });
  })
}
