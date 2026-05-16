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
import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/CommonMethod/CommonMethodIndex';
const PAGE_NAME = 'CommonMethodIndex';

function getAttrStringByKey(key: string, attrName: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString(attrName);
}

export default function CommonMethodTest() {
  describe('CommonMethodTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.common.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      routerInstance.replaceUrl(options);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(routerInstance.getState().name).assertEqual(PAGE_NAME);
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number CommonMethodTest_001
     * @tc.name responseRegionList
     * @tc.desc Verify CommonMethod.responseRegionList method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('responseRegionList', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let strJson = inspector.getInspectorByKey('commonMethodResponseRegionListBtnKey');
        console.info('responseRegionList value :' + strJson);
        expect(strJson.includes('resposeRegionList') ||
          strJson.includes('responseRegionList') ||
          strJson.includes('responseRegion')).assertTrue();
      } catch (error) {
        console.error('responseRegionList error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number CommonMethodTest_002
     * @tc.name backgroundColor
     * @tc.desc Verify CommonMethod.backgroundColor method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('backgroundColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const value = getAttrStringByKey('commonMethodBackgroundColorBtnKey', 'backgroundColor');
        console.info('backgroundColor value :' + value);
        expect(value).assertEqual('#FFFF0000');
      } catch (error) {
        console.error('backgroundColor error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number CommonMethodTest_003
     * @tc.name materialFilter
     * @tc.desc Verify CommonMethod.materialFilter method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('materialFilter', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let strJson = inspector.getInspectorByKey('materialId');
        console.info('materialFilter materialId value :' + strJson);
        expect(!strJson.includes('materialFilter')).assertTrue();
      } catch (error) {
        console.error('materialFilter error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number CommonMethodTest_004
     * @tc.name transform3D
     * @tc.desc Verify CommonMethod.transform3D method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('transform3D', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let strJson = inspector.getInspectorByKey('commonMethodTransform3DBtnKey');
        console.info('transform3D value :' + strJson);
        expect(!strJson.includes('transform3D')).assertTrue();
      } catch (error) {
        console.error('transform3D error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number CommonMethodTest_005
     * @tc.name bindContextMenuWithResponse
     * @tc.desc Verify CommonMethod.bindContextMenuWithResponse method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('bindContextMenuWithResponse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let strJson = inspector.getInspectorByKey('commonMethodBindContextMenuWithResponseBtnKey');
        console.info('bindContextMenuWithResponse value :' + strJson);
        expect(strJson.includes('bindContextMenuWithResponse')).assertTrue();
      } catch (error) {
        console.error('bindContextMenuWithResponse error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number CommonMethodTest_007
     * @tc.name accessibilityActionOptions
     * @tc.desc Verify CommonMethod.accessibilityActionOptions method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('accessibilityActionOptions', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let strJson = inspector.getInspectorByKey('commonMethodAccessibilityActionOptionsBtnKey');
        console.info('accessibilityActionOptions value :' + strJson);
        console.error('accessibilityActionOptions  strJson.includes(\'accessibilityActionOptions\'): ' +  strJson.includes('accessibilityActionOptions'));
        expect(strJson.includes('accessibilityActionOptions')).assertTrue();
      } catch (error) {
        console.error('accessibilityActionOptions error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
