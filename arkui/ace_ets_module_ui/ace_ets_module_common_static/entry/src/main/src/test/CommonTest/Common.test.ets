'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { LayoutSafeAreaEdge, BackgroundOptions } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function CommonTest() {
  describe('CommonTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] CommonTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.ets.module.common.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] CommonTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Common/CommonIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] CommonTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "CommonIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] CommonTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] CommonTest afterEach start");
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] CommonTest afterEach end");
    });

    /**
     * @tc.number SUB_ARKUI_ACE_COMMON_0100
     * @tc.name layoutSafeAreaEdgeTopEnum
     * @tc.desc Test LayoutSafeAreaEdge.TOP enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layoutSafeAreaEdgeTopEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CommonTest: layoutSafeAreaEdgeTopEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(LayoutSafeAreaEdge.TOP != undefined).assertTrue();
        console.info('[ARKUI_NEW] CommonTest: layoutSafeAreaEdgeTopEnum END');
        done();
      } catch (error) { console.error('[ARKUI_NEW] error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_COMMON_0200
     * @tc.name layoutSafeAreaEdgeBottomEnum
     * @tc.desc Test LayoutSafeAreaEdge.BOTTOM enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layoutSafeAreaEdgeBottomEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CommonTest: layoutSafeAreaEdgeBottomEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(LayoutSafeAreaEdge.BOTTOM != undefined).assertTrue();
        console.info('[ARKUI_NEW] CommonTest: layoutSafeAreaEdgeBottomEnum END');
        done();
      } catch (error) { console.error('[ARKUI_NEW] error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_COMMON_0300
     * @tc.name ignoresLayoutSafeAreaEdgesFieldSet
     * @tc.desc Test BackgroundOptions.ignoresLayoutSafeAreaEdges field can be set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ignoresLayoutSafeAreaEdgesFieldSet', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CommonTest: ignoresLayoutSafeAreaEdgesFieldSet START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: BackgroundOptions = {
          ignoresLayoutSafeAreaEdges: [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM]
        };
        expect(opts.ignoresLayoutSafeAreaEdges != undefined).assertTrue();
        expect(opts.ignoresLayoutSafeAreaEdges!.length).assertEqual(2);
        expect(opts.ignoresLayoutSafeAreaEdges![0]).assertEqual(LayoutSafeAreaEdge.TOP);
        expect(opts.ignoresLayoutSafeAreaEdges![1]).assertEqual(LayoutSafeAreaEdge.BOTTOM);
        let edges: Array<LayoutSafeAreaEdge> = [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM];
        expect(edges.length).assertEqual(2);
        expect(edges[0]).assertEqual(LayoutSafeAreaEdge.TOP);
        expect(edges[1]).assertEqual(LayoutSafeAreaEdge.BOTTOM);
        console.info('[ARKUI_NEW] CommonTest: ignoresLayoutSafeAreaEdgesFieldSet END');
        done();
      } catch (error) { console.error('[ARKUI_NEW] error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_COMMON_0400
     * @tc.name commonPageRenders
     * @tc.desc Verify common test page renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('commonPageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CommonTest: commonPageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('commonRoot'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] CommonTest: commonPageRenders END');
        done();
      } catch (error) { console.error('[ARKUI_NEW] error:' + error); expect().assertFail(); done(); }
    });
  });
}
