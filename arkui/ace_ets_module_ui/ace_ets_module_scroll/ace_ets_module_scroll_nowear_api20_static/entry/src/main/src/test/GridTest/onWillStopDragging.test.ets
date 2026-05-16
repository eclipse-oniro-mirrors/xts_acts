'use static'

import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, ON, MouseButton, MatchPattern, UiDirection, Rect } from '@kit.TestKit';
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

export default function onWillStopDraggingTest() {
  describe('ActsOnWillStopDraggingTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility');
    })
    beforeEach(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_onWillStopDragging',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextLineSpacingTest state pages: ' + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          console.info('get TextLineSpacingTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('push TextLineSpacingTest page error: ' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   test_onWillStopDragging
     * @tc.name     test_onWillStopDragging
     * @tc.desc     test_onWillStopDragging
     * @tc.level    Level.LEVEL0
     */
    it('test_onWillStopDragging', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      let dragScroll = await driver.findComponent(ON.id('grid_dragging'));
      const rect = await (dragScroll?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let right = rect.right;
      let left = rect.left;
      let bottom = rect.bottom;
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2).toInt(), Math.round(top + height*0.8).toInt(), Math.round(left + width/2).toInt(),Math.round(top + height*0.2).toInt(), 1000);
      await CommonFunc.sleep(2000);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('onWillStopDragging'))
        .getElement('$attrs')
        .getString('content'))
        .assertEqual('第1次拖拽停止');
      done();
    })
  })
}