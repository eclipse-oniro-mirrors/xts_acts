'use static';
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

import { describe, it, expect, Level, beforeAll, beforeEach } from '../../../../hypium/index';
import dragController from '@ohos.arkui.dragController';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { waitForMainRouterForStaticTest } from '../../../ets/MainAbility/common/UIContextStaticTestBridge';
import {
  DragSpringLoadingTestBridge,
  SpringLoadingContextForBridge,
} from '../../../ets/MainAbility/common/DragSpringLoadingTestBridge';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

/**
 * BEGIN 阶段契约用替身；对象字面量不可用（ESE0074），须显式 implements 与接口一致（ESE0091）。
 */
class SpringLoadingBeginContextDouble implements SpringLoadingContextForBridge {
  state: dragController.DragSpringLoadingState = dragController.DragSpringLoadingState.BEGIN;
  currentNotifySequence: int = 0 as int;
  dragInfos?: dragController.SpringLoadingDragInfos;
  currentConfig?: dragController.DragSpringLoadingConfiguration;

  constructor() {
    this.currentConfig = {
      stillTimeLimit: 400,
      updateInterval: 100,
      updateNotifyCount: 2,
      updateToFinishInterval: 100,
    };
  }

  abort(): void {
  }

  updateConfiguration(c: dragController.DragSpringLoadingConfiguration): void {
  }
}

function springLoadingBeginContextForContractTest(): SpringLoadingContextForBridge {
  return new SpringLoadingBeginContextDouble() as SpringLoadingContextForBridge;
}

export default function DragControllerTest(): void {
  describe('DragControllerTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DragControllerTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.commonEvents.api24.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('DragControllerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragSpringLoading/DragSpringLoadingIndex',
      };
      try {
        let r = await waitForMainRouterForStaticTest();
        expect(r !== undefined && r !== null).assertTrue();
        r!.clear();
        let pages = r!.getState();
        console.info('DragControllerTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'DragSpringLoadingIndex') {
          await r!.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('DragControllerTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ArkUI_DragController_DragSpringLoadingStateBegin_0100
     * @tc.name SUB_ArkUI_DragController_DragSpringLoadingStateBegin_0100
     * @tc.desc Test DragSpringLoadingState BEGIN enum value, verify BEGIN=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_DragSpringLoadingStateBegin_0100', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: dragSpringLoadingStateBegin begin');
      expect(dragController.DragSpringLoadingState.BEGIN).assertEqual(0);
      console.info('DragControllerTest: dragSpringLoadingStateBegin end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_DragSpringLoadingStateUpdate_0200
     * @tc.name SUB_ArkUI_DragController_DragSpringLoadingStateUpdate_0200
     * @tc.desc Test DragSpringLoadingState UPDATE enum value, verify UPDATE=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_DragSpringLoadingStateUpdate_0200', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: dragSpringLoadingStateUpdate begin');
      expect(dragController.DragSpringLoadingState.UPDATE).assertEqual(1);
      console.info('DragControllerTest: dragSpringLoadingStateUpdate end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_DragSpringLoadingStateEnd_0300
     * @tc.name SUB_ArkUI_DragController_DragSpringLoadingStateEnd_0300
     * @tc.desc Test DragSpringLoadingState END enum value, verify END=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_DragSpringLoadingStateEnd_0300', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: dragSpringLoadingStateEnd begin');
      expect(dragController.DragSpringLoadingState.END).assertEqual(2);
      console.info('DragControllerTest: dragSpringLoadingStateEnd end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_DragSpringLoadingStateCancel_0400
     * @tc.name SUB_ArkUI_DragController_DragSpringLoadingStateCancel_0400
     * @tc.desc Test DragSpringLoadingState CANCEL enum value, verify CANCEL=3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_DragSpringLoadingStateCancel_0400', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: dragSpringLoadingStateCancel begin');
      expect(dragController.DragSpringLoadingState.CANCEL).assertEqual(3);
      console.info('DragControllerTest: dragSpringLoadingStateCancel end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_DragInfo_PointerIdOnly_0500
     * @tc.name SUB_ArkUI_DragController_DragInfo_PointerIdOnly_0500
     * @tc.desc Test DragInfo with required pointerId only; dataLoadParams stays absent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_DragInfo_PointerIdOnly_0500', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: dragInfoRequiredPointerIdOptionalDataLoadParams begin');
      let dragInfo: dragController.DragInfo = {
        pointerId: 9,
      };
      expect(dragInfo.pointerId).assertEqual(9);
      expect(dragInfo.dataLoadParams !== undefined).assertFalse();
      console.info('DragControllerTest: dragInfoRequiredPointerIdOptionalDataLoadParams end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_DragInfo_DataLoadParams_0600
     * @tc.name SUB_ArkUI_DragController_DragInfo_DataLoadParams_0600
     * @tc.desc Test DragInfo optional dataLoadParams with unifiedDataChannel.DataLoadParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_DragInfo_DataLoadParams_0600', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: dragInfoWithDataLoadParams begin');
      let dragInfo: dragController.DragInfo = {
        pointerId: 1,
        dataLoadParams: {
          loadHandler: (acceptableInfo?: unifiedDataChannel.DataLoadInfo): unifiedDataChannel.UnifiedData | null => {
            return null;
          },
          dataLoadInfo: {
            recordCount: 2,
          },
        },
      };
      expect(dragInfo.pointerId).assertEqual(1);
      let dataLoadParams = dragInfo.dataLoadParams;
      expect(dataLoadParams !== undefined).assertTrue();
      if (dataLoadParams !== undefined) {
        expect(dataLoadParams.dataLoadInfo.recordCount).assertEqual(2);
      }
      console.info('DragControllerTest: dragInfoWithDataLoadParams end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_SpringLoadingConfiguration_AllFields_0700
     * @tc.name SUB_ArkUI_DragController_SpringLoadingConfiguration_AllFields_0700
     * @tc.desc Test DragSpringLoadingConfiguration optional int fields assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_SpringLoadingConfiguration_AllFields_0700', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: dragSpringLoadingConfigurationAllFields begin');
      let configuration: dragController.DragSpringLoadingConfiguration = {
        stillTimeLimit: 100,
        updateInterval: 200,
        updateNotifyCount: 3,
        updateToFinishInterval: 400,
      };
      expect(configuration.stillTimeLimit).assertEqual(100);
      expect(configuration.updateInterval).assertEqual(200);
      expect(configuration.updateNotifyCount).assertEqual(3);
      expect(configuration.updateToFinishInterval).assertEqual(400);
      console.info('DragControllerTest: dragSpringLoadingConfigurationAllFields end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_SpringLoadingConfiguration_PartialFields_0800
     * @tc.name SUB_ArkUI_DragController_SpringLoadingConfiguration_PartialFields_0800
     * @tc.desc Test DragSpringLoadingConfiguration with a single optional field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_SpringLoadingConfiguration_PartialFields_0800', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: dragSpringLoadingConfigurationPartialFields begin');
      let configuration: dragController.DragSpringLoadingConfiguration = {
        stillTimeLimit: 500,
      };
      expect(configuration.stillTimeLimit).assertEqual(500);
      expect(configuration.updateInterval !== undefined).assertFalse();
      console.info('DragControllerTest: dragSpringLoadingConfigurationPartialFields end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_SpringLoadingDragInfos_OptionalAbsent_0900
     * @tc.name SUB_ArkUI_DragController_SpringLoadingDragInfos_OptionalAbsent_0900
     * @tc.desc Test SpringLoadingDragInfos with no optional properties set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_SpringLoadingDragInfos_OptionalAbsent_0900', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: springLoadingDragInfosOptionalFieldsAbsent begin');
      let dragInfos: dragController.SpringLoadingDragInfos = {};
      expect(dragInfos.dataSummary !== undefined).assertFalse();
      expect(dragInfos.extraInfos !== undefined).assertFalse();
      console.info('DragControllerTest: springLoadingDragInfosOptionalFieldsAbsent end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_SpringLoadingDragInfos_ExtraInfos_1000
     * @tc.name SUB_ArkUI_DragController_SpringLoadingDragInfos_ExtraInfos_1000
     * @tc.desc Test SpringLoadingDragInfos optional extraInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_SpringLoadingDragInfos_ExtraInfos_1000', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: springLoadingDragInfosExtraInfos begin');
      let dragInfos: dragController.SpringLoadingDragInfos = {
        extraInfos: 'spring-loading-extra',
      };
      expect(dragInfos.extraInfos).assertEqual('spring-loading-extra');
      console.info('DragControllerTest: springLoadingDragInfosExtraInfos end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_SpringLoadingDragInfos_DataSummary_1100
     * @tc.name SUB_ArkUI_DragController_SpringLoadingDragInfos_DataSummary_1100
     * @tc.desc Test SpringLoadingDragInfos optional dataSummary with unifiedDataChannel.Summary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_SpringLoadingDragInfos_DataSummary_1100', Level.LEVEL1, (done: () => void) => {
      console.info('DragControllerTest: springLoadingDragInfosDataSummary begin');
      let summary: unifiedDataChannel.Summary = new unifiedDataChannel.Summary();
      summary.totalSize = 128;
      let dragInfos: dragController.SpringLoadingDragInfos = {
        dataSummary: summary,
      };
      let dataSummary = dragInfos.dataSummary;
      expect(dataSummary !== undefined).assertTrue();
      if (dataSummary !== undefined) {
        expect(dataSummary.totalSize).assertEqual(128);
      }
      console.info('DragControllerTest: springLoadingDragInfosDataSummary end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DragController_SpringLoadingContext_AbortContract_1200
     * @tc.name SUB_ArkUI_DragController_SpringLoadingContext_AbortContract_1200
     * @tc.desc SpringLoadingContext from onDragSpringLoading: BEGIN fields and abort()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_SpringLoadingContext_AbortContract_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DragControllerTest: springLoadingContextRequiredFieldsAndAbort START');
      try {
        await Utils.sleep(SLEEP_TIME);
        DragSpringLoadingTestBridge.reset(0);
        DragSpringLoadingTestBridge.onSpringLoading(springLoadingBeginContextForContractTest());
        expect(DragSpringLoadingTestBridge.callbackCount > 0).assertTrue();
        expect(DragSpringLoadingTestBridge.beginState).assertEqual(dragController.DragSpringLoadingState.BEGIN);
        expect(DragSpringLoadingTestBridge.beginSequence).assertEqual(0);
        expect(DragSpringLoadingTestBridge.beginConfigStillMs).assertEqual(400);
        expect(DragSpringLoadingTestBridge.abortAfterBeginCount).assertEqual(1);
        console.info('DragControllerTest: springLoadingContextRequiredFieldsAndAbort END');
        done();
      } catch (error) {
        console.error('DragControllerTest: springLoadingContextRequiredFieldsAndAbort error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ArkUI_DragController_SpringLoadingContext_UpdateConfigurationContract_1300
     * @tc.name SUB_ArkUI_DragController_SpringLoadingContext_UpdateConfigurationContract_1300
     * @tc.desc SpringLoadingContext from onDragSpringLoading: updateConfiguration() in BEGIN then abort()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_DragController_SpringLoadingContext_UpdateConfigurationContract_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DragControllerTest: springLoadingContextUpdateConfiguration START');
      try {
        await Utils.sleep(SLEEP_TIME);
        DragSpringLoadingTestBridge.reset(1);
        DragSpringLoadingTestBridge.onSpringLoading(springLoadingBeginContextForContractTest());
        DragSpringLoadingTestBridge.logSnapshot('after onSpringLoading (UpdateConfiguration contract)');
        console.info('[SpringProbe] assert callbackCount>0; callbackCount=' + DragSpringLoadingTestBridge.callbackCount);
        expect(DragSpringLoadingTestBridge.callbackCount > 0).assertTrue();
        expect(DragSpringLoadingTestBridge.updateConfigurationExecuted).assertTrue();
        expect(DragSpringLoadingTestBridge.beginConfigStillMs).assertEqual(400);
        expect(DragSpringLoadingTestBridge.abortAfterBeginCount).assertEqual(1);
        console.info('DragControllerTest: springLoadingContextUpdateConfiguration END');
        done();
      } catch (error) {
        console.error('DragControllerTest: springLoadingContextUpdateConfiguration error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
