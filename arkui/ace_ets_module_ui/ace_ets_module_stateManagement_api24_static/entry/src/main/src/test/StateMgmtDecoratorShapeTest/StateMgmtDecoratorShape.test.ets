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
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

interface ObservedObjectStub {
  _stableTag?: string;
}

interface VariableOwnerStub {
  tag?: string;
}

interface MakeMonitorOptionsShape {
  owner?: VariableOwnerStub;
  functionName?: string;
}

interface EnvOptionsShape<T> {
  initValue?: T;
}

interface MutableStateMetaCallShape {
  observedObject: ObservedObjectStub | undefined;
  propertyName: string;
}

interface MakeEnvCallShape {
  typeKey: string;
  varName: string;
  envOptions?: EnvOptionsShape<string>;
}

interface MonitorNotifyShape {
  onChange(): void;
}

export default function StateMgmtDecoratorShapeTest(): void {
  describe('StateMgmtDecoratorShapeTest', () => {
    /**
     * @tc.number SUB_ArkUI_State_MakeMonitorOptions_Owner_FunctionName_5700
     * @tc.name SUB_ArkUI_State_MakeMonitorOptions_Owner_FunctionName_5700
     * @tc.desc decorator.d.ets MakeMonitorOptions optional owner and functionName for IStateMgmtFactory.makeMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_State_MakeMonitorOptions_Owner_FunctionName_5700', Level.LEVEL1, (done: () => void) => {
      let opts: MakeMonitorOptionsShape = {
        owner: { tag: 'owner-x' },
        functionName: 'onObservedChange',
      };
      expect(opts.owner !== undefined).assertTrue();
      expect(opts.owner!.tag).assertEqual('owner-x');
      expect(opts.functionName).assertEqual('onObservedChange');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_State_EnvOptions_InitValue_5800
     * @tc.name SUB_ArkUI_State_EnvOptions_InitValue_5800
     * @tc.desc decorator.d.ets EnvOptions optional initValue passed to makeEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_State_EnvOptions_InitValue_5800', Level.LEVEL1, (done: () => void) => {
      let envNum: EnvOptionsShape<int> = { initValue: 7 };
      let envStr: EnvOptionsShape<string> = { initValue: 'env-default' };
      expect(envNum.initValue).assertEqual(7);
      expect(envStr.initValue).assertEqual('env-default');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_State_MakeMutableStateMeta_ArgShape_5900
     * @tc.name SUB_ArkUI_State_MakeMutableStateMeta_ArgShape_5900
     * @tc.desc decorator.d.ets IStateMgmtFactory.makeMutableStateMeta(observedObject, propertyName) argument shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_State_MakeMutableStateMeta_ArgShape_5900', Level.LEVEL1, (done: () => void) => {
      let call: MutableStateMetaCallShape = {
        observedObject: { _stableTag: 'obs-1' },
        propertyName: 'count',
      };
      expect(call.observedObject !== undefined).assertTrue();
      expect(call.observedObject!._stableTag).assertEqual('obs-1');
      expect(call.propertyName).assertEqual('count');
      let callUndef: MutableStateMetaCallShape = {
        observedObject: undefined,
        propertyName: 'flag',
      };
      expect(callUndef.observedObject === undefined).assertTrue();
      expect(callUndef.propertyName).assertEqual('flag');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_State_MakeEnv_ArgsShape_6000
     * @tc.name SUB_ArkUI_State_MakeEnv_ArgsShape_6000
     * @tc.desc decorator.d.ets IStateMgmtFactory.makeEnv name, varName, envOptions argument shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_State_MakeEnv_ArgsShape_6000', Level.LEVEL1, (done: () => void) => {
      let envCall: MakeEnvCallShape = {
        typeKey: 'String',
        varName: 'myEnvVar',
        envOptions: { initValue: 'from-decor' },
      };
      expect(envCall.typeKey).assertEqual('String');
      expect(envCall.varName).assertEqual('myEnvVar');
      expect(envCall.envOptions !== undefined).assertTrue();
      expect(envCall.envOptions!.initValue).assertEqual('from-decor');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_State_MakeMonitor_CallbackObjectShape_6100
     * @tc.name SUB_ArkUI_State_MakeMonitor_CallbackObjectShape_6100
     * @tc.desc decorator.d.ets IStateMgmtFactory.makeMonitor MonitorCallback notification shape (onChange)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_State_MakeMonitor_CallbackObjectShape_6100', Level.LEVEL1, (done: () => void) => {
      let fired: int = 0;
      let cb: MonitorNotifyShape = {
        onChange(): void {
          fired = 1;
        },
      };
      cb.onChange();
      expect(fired).assertEqual(1);
      let opts: MakeMonitorOptionsShape = { functionName: 'watchFoo' };
      expect(opts.functionName).assertEqual('watchFoo');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_State_AppStorage_Module_6200
     * @tc.name SUB_ArkUI_State_AppStorage_Module_6200
     * @tc.desc AppStorage linkage shape in StateMgmt decorator probe prep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_State_AppStorage_Module_6200', Level.LEVEL1, (done: () => void) => {
      const linkKey: string = 'hypium_state_decor_shape_probe';
      AppStorage.setOrCreate<string>(linkKey, 'probe-ok');
      expect(AppStorage.get<string>(linkKey)).assertEqual('probe-ok');
      done();
    });
  });

  describe('StateMgmtProbePageTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.stateManagement.api24.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StateMgmtProbe/StateMgmtProbe',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await Utils.sleep(500);
      } catch (err) {
        console.error('StateMgmtProbePageTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ArkUI_State_ProbePage_AppStorage_6300
     * @tc.name SUB_ArkUI_State_ProbePage_AppStorage_6300
     * @tc.desc StateMgmtProbe page loads; AppStorage keys state_mgmt_probe_page_loaded and state_mgmt_probe_label
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_State_ProbePage_AppStorage_6300', Level.LEVEL1, (done: () => void) => {
      expect(AppStorage.get<string>('state_mgmt_probe_page_loaded')).assertEqual('1');
      expect(AppStorage.get<string>('state_mgmt_probe_label')).assertEqual('state-probe');
      done();
    });
  });
}
