'use static'

import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, ON, MouseButton, MatchPattern, UiDirection } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

import CommonFunc from '../common/Common';
import Utils from '../common/Utils';
import { startAbility, UtilsTest } from '../Util.test.ets';

let want: Want;
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function contentStartOffsetTest() {
  describe('ActsContentStartOffsetTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('ContentStartOffsetTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility');
    })

    beforeEach(async (): Promise<void> => {
      console.info('ContentStartOffsetTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_contentStartOffset',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ContentStartOffsetTest state pages: ' + JSON.stringify(pages));
        if (!('Grid_contentStartOffset' == pages.name)) {
          console.info('get ContentStartOffsetTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('push ContentStartOffsetTest page error: ' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   test_ContentStartOffset
     * @tc.name     test_ContentStartOffset
     * @tc.desc     test_ContentStartOffset
     * @tc.level    Level.LEVEL0
     */
    it('test_ContentStartOffset', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      expect(parseInt(JSON.parseJsonElement(inspector.getInspectorByKey('contentStartOffset'))
        .getElement('$attrs')
        .getString('contentStartOffset')))
        .assertEqual(60);
      expect(parseInt(JSON.parseJsonElement(inspector.getInspectorByKey('contentStartOffset1'))
        .getElement('$attrs')
        .getString('contentStartOffset')))
        .assertEqual(0);
      expect(parseInt(JSON.parseJsonElement(inspector.getInspectorByKey('contentStartOffset3'))
        .getElement('$attrs')
        .getString('contentStartOffset')))
        .assertEqual(0);
      done();
    })
  })
}