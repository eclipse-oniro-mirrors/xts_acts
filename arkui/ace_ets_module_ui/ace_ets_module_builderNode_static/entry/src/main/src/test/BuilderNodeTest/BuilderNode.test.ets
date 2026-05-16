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

const SLEEP_TIME = 1000;

export default function BuilderNodeTest() {
  describe('BuilderNodeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.builderNode.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/BuilderNode/BuilderNodeIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] BuilderNodeTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "BuilderNodeIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] BuilderNodeTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] BuilderNodeTest afterEach start");
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] BuilderNodeTest afterEach end");
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_0100
     * @tc.name nodeRenderTypeDisplay
     * @tc.desc Test NodeRenderType.RENDER_TYPE_DISPLAY enum value from AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeRenderTypeDisplay', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: nodeRenderTypeDisplay START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('nodeRenderTypeDisplay');
        console.info('[ARKUI_NEW] nodeRenderTypeDisplay = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: nodeRenderTypeDisplay END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] nodeRenderTypeDisplay error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_0200
     * @tc.name nodeRenderTypeTexture
     * @tc.desc Test NodeRenderType.RENDER_TYPE_TEXTURE enum value from AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeRenderTypeTexture', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: nodeRenderTypeTexture START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('nodeRenderTypeTexture');
        console.info('[ARKUI_NEW] nodeRenderTypeTexture = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: nodeRenderTypeTexture END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] nodeRenderTypeTexture error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_0300
     * @tc.name competitionStrategyEnum
     * @tc.desc Test CompetitionStrategy enum values from AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('competitionStrategyEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: competitionStrategyEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let defaultVal = AppStorage.get<string>('competitionStrategyDefault');
        let competitionVal = AppStorage.get<string>('competitionStrategyCompetition');
        console.info('[ARKUI_NEW] competitionStrategyDefault = ' + defaultVal);
        console.info('[ARKUI_NEW] competitionStrategyCompetition = ' + competitionVal);
        expect(defaultVal != null && defaultVal != undefined).assertTrue();
        expect(competitionVal != null && competitionVal != undefined).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: competitionStrategyEnum END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] competitionStrategyEnum error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_0400
     * @tc.name builderNodePageRenders
     * @tc.desc Verify BuilderNode test page root component renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builderNodePageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodePageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('builderNodeRoot');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodePageRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] builderNodePageRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_0500
     * @tc.name builderNodeInstanceCreated
     * @tc.desc Verify BuilderNode instance was created and built
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builderNodeInstanceCreated', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodeInstanceCreated START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('builderNodeCreated');
        console.info('[ARKUI_NEW] builderNodeCreated = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodeInstanceCreated END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] builderNodeInstanceCreated error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_0600
     * @tc.name builderNodeGetFrameNode
     * @tc.desc Verify BuilderNode.getFrameNode was called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builderNodeGetFrameNode', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodeGetFrameNode START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('builderNodeFrameNode');
        console.info('[ARKUI_NEW] builderNodeFrameNode = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodeGetFrameNode END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] builderNodeGetFrameNode error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_0700
     * @tc.name builderNodePostTouchEvent
     * @tc.desc Verify BuilderNode.postTouchEvent was called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builderNodePostTouchEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodePostTouchEvent START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('postTouchEventResult');
        console.info('[ARKUI_NEW] postTouchEventResult = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodePostTouchEvent END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] builderNodePostTouchEvent error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_0800
     * @tc.name builderNodePostInputEvent
     * @tc.desc Verify BuilderNode.postInputEvent was called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builderNodePostInputEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodePostInputEvent START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('postInputEventResult');
        console.info('[ARKUI_NEW] postInputEventResult = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodePostInputEvent END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] builderNodePostInputEvent error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_0900
     * @tc.name builderNodeDispose
     * @tc.desc Verify BuilderNode.dispose was called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builderNodeDispose', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodeDispose START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('builderNodeDisposed');
        console.info('[ARKUI_NEW] builderNodeDisposed = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodeDispose END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] builderNodeDispose error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_1000
     * @tc.name builderNodeIsDisposed
     * @tc.desc Verify BuilderNode.isDisposed was called after dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builderNodeIsDisposed', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodeIsDisposed START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('builderNodeIsDisposed');
        console.info('[ARKUI_NEW] builderNodeIsDisposed = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodeIsDisposed END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] builderNodeIsDisposed error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BUILDERNODE_1100
     * @tc.name builderNodeButtonRendered
     * @tc.desc Verify Button component rendered in page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builderNodeButtonRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodeButtonRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('builderNodeBtn');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] BuilderNodeTest execute: builderNodeButtonRendered END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] builderNodeButtonRendered error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
