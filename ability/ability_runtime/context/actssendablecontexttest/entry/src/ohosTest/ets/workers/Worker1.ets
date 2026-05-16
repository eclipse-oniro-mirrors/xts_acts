/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import worker, { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope } from '@ohos.worker';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import sendableContextManager from '@ohos.app.ability.sendableContextManager';
import contextConstant from '@ohos.app.ability.contextConstant';
import hilog from '@ohos.hilog';
import relationalStore from '@ohos.data.relationalStore';
import resourceManager from '@ohos.resourceManager';
import { SendableContextObject, NormalContextObject } from '../common/SendableContextObject'

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
let store: relationalStore.RdbStore | undefined = undefined;

workerPort.onmessage = (e: MessageEvents) => {
  let object: NormalContextObject = e.data;
  let normalContext: common.Context = object.normalContext;
  if (object.contextName === 'EntryAbilityContext') {
    // case1: type-matched convert
    hilog.info(0x0000, 'testTag', '%{public}s', 'uiability context convert to uiability context.');
    try {
      let context: common.UIAbilityContext = normalContext as common.UIAbilityContext;
      // 基类
      hilog.info(0x0000, 'testTag', 'uiability context convert to uiability context: %{public}s',
        JSON.stringify(context));
      hilog.info(0x0000, 'testTag', 'Worker uiability context.resourceManager: %{public}s',
        JSON.stringify(context.resourceManager));
      hilog.info(0x0000, 'testTag', 'Worker uiability context.applicationInfo: %{public}s',
        JSON.stringify(context.applicationInfo));
      hilog.info(0x0000, 'testTag', 'Worker uiability context.cacheDir: %{public}s', context.cacheDir);
      hilog.info(0x0000, 'testTag', 'Worker uiability context.tempDir: %{public}s', context.tempDir);
      hilog.info(0x0000, 'testTag', 'Worker uiability context.filesDir: %{public}s', context.filesDir);
      hilog.info(0x0000, 'testTag', 'Worker uiability context.databaseDir: %{public}s', context.databaseDir);
      hilog.info(0x0000, 'testTag', 'Worker uiability context.preferencesDir: %{public}s', context.preferencesDir);
      hilog.info(0x0000, 'testTag', 'Worker uiability context.bundleCodeDir: %{public}s', context.bundleCodeDir);
      hilog.info(0x0000, 'testTag', 'Worker uiability context.distributedFilesDir: %{public}s',
        context.distributedFilesDir);
      hilog.info(0x0000, 'testTag', 'Worker uiability context.resourceDir: %{public}s', context.resourceDir);
      hilog.info(0x0000, 'testTag', 'Worker uiability context.area: %{public}d', context.area);
      // eventhub
      // switch area
      context.area = contextConstant.AreaMode.EL4;
      // other func

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker uiability createBundleContext');
        let bundleContext: common.Context = context.createBundleContext('com.acts.sendablecontextsameworker');
        hilog.info(0x0000, 'testTag', 'Worker uiability createBundleContext bundleContext: %{public}s',
          JSON.stringify(bundleContext));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker uiability createBundleContext failed: %{public}s', JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker uiability createModuleContext');
        let moduleContext1: common.Context = context.createModuleContext('entry');
        hilog.info(0x0000, 'testTag', 'Worker uiability createModuleContext moduleContext1: %{public}s',
          JSON.stringify(moduleContext1));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker uiability createModuleContext failed: %{public}s', JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker uiability createModuleContext');
        let moduleContext2: common.Context = context.createModuleContext('com.acts.sendablecontextsameworker', 'entry');
        hilog.info(0x0000, 'testTag', 'Worker uiability createModuleContext moduleContext2: %{public}s',
          JSON.stringify(moduleContext2));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker uiability createModuleContext failed: %{public}s', JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker uiability createSystemHspModuleResourceManager');
        let resMgr1: resourceManager.ResourceManager =
          context.createSystemHspModuleResourceManager('com.acts.sendablecontextsameworker', 'entry');
        let config = resMgr1.getConfigurationSync();
        hilog.info(0x0000, 'testTag', 'Worker uiability resMgr1 config: %{public}s', JSON.stringify(config));
      } catch (error) {
        // cause 'entry' is not a hsp, it will failed.
        hilog.info(0x0000, 'testTag', 'Worker uiability createSystemHspModuleResourceManager failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker uiability createModuleResourceManager');
        let resMgr2: resourceManager.ResourceManager =
          context.createModuleResourceManager('com.acts.sendablecontextsameworker', 'entry');
        let config = resMgr2.getConfigurationSync();
        hilog.info(0x0000, 'testTag', 'Worker uiability resMgr2 config: %{public}s', JSON.stringify(config));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker uiability createModuleResourceManager failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker uiability getApplicationContext');
        let applicationContext: common.ApplicationContext = context.getApplicationContext();
        hilog.info(0x0000, 'testTag', 'Worker uiability getApplicationContext applicationContext: %{public}s',
          JSON.stringify(applicationContext));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker uiability getApplicationContext failed: %{public}s',
          JSON.stringify(error));
      }

      hilog.info(0x0000, 'testTag', '%{public}s', 'Worker uiability getGroupDir');
      context.getGroupDir('1', (err: BusinessError, data) => {
        if (err) {
          console.error(`Worker uiability getGroupDir faile, err: ${JSON.stringify(err)}`);
        } else {
          console.log(`Worker uiability getGroupDir result is: ${JSON.stringify(data)}`);
        }
      });

      // 独有的方法
      // 获取context后调用getRdbStore
      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: 'RdbTest.db',
        securityLevel: relationalStore.SecurityLevel.S1
      };

      relationalStore.getRdbStore(context, STORE_CONFIG).then(async (rdbStore: relationalStore.RdbStore) => {
        store = rdbStore;
        hilog.info(0x0000, 'testTag', '%{public}s', 'Get RdbStore successfully.');
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'testTag', 'Get RdbStore failed %{public}s.', JSON.stringify(err));
      })
      workerPort.postMessage({'key': '[NormalContext] UIAbilityContext after convert and post', 'value': 'succeed'});
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'uiability context convert to uiability context failed %{public}s',
        JSON.stringify(error));
      workerPort.postMessage({'key': '[NormalContext] UIAbilityContext after convert and post', 'value': 'failed'});
    }
  }

  if (object.contextName === 'AbilityStageContext') {
    // case1: type-matched convert
    hilog.info(0x0000, 'testTag', '%{public}s', 'abilitystage context convert to abilitystage context.');
    try {
      let context: common.AbilityStageContext = normalContext as common.AbilityStageContext;
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context: %{public}s', JSON.stringify(context));
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.resourceManager: %{public}s',
        JSON.stringify(context.resourceManager));
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.applicationInfo: %{public}s',
        JSON.stringify(context.applicationInfo));
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.cacheDir: %{public}s', context.cacheDir);
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.tempDir: %{public}s', context.tempDir);
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.filesDir: %{public}s', context.filesDir);
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.databaseDir: %{public}s', context.databaseDir);
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.preferencesDir: %{public}s', context.preferencesDir);
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.bundleCodeDir: %{public}s', context.bundleCodeDir);
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.distributedFilesDir: %{public}s',
        context.distributedFilesDir);
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.resourceDir: %{public}s', context.resourceDir);
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.area: %{public}d', context.area);
      // eventhub
      // switch area
      context.area = contextConstant.AreaMode.EL3;
      // other func

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker AbilityStage createBundleContext');
        let bundleContext: common.Context = context.createBundleContext('com.acts.sendablecontextsameworker');
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage createBundleContext bundleContext: %{public}s',
          JSON.stringify(bundleContext));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage createBundleContext failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker AbilityStage createModuleContext');
        let moduleContext1: common.Context = context.createModuleContext('entry');
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage createModuleContext moduleContext1: %{public}s',
          JSON.stringify(moduleContext1));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage createModuleContext failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker AbilityStage createModuleContext');
        let moduleContext2: common.Context = context.createModuleContext('com.acts.sendablecontextsameworker', 'entry');
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage createModuleContext moduleContext2: %{public}s',
          JSON.stringify(moduleContext2));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage createModuleContext failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker AbilityStage createSystemHspModuleResourceManager');
        let resMgr1: resourceManager.ResourceManager =
          context.createSystemHspModuleResourceManager('com.acts.sendablecontextsameworker', 'entry');
        let config = resMgr1.getConfigurationSync();
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage resMgr1 config: %{public}s', JSON.stringify(config));
      } catch (error) {
        // cause 'entry' is not a hsp, it will failed.
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage createSystemHspModuleResourceManager failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker AbilityStage createModuleResourceManager');
        let resMgr2: resourceManager.ResourceManager =
          context.createModuleResourceManager('com.acts.sendablecontextsameworker', 'entry');
        let config = resMgr2.getConfigurationSync();
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage resMgr2 config: %{public}s', JSON.stringify(config));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage createModuleResourceManager failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker AbilityStage getApplicationContext');
        let applicationContext: common.ApplicationContext = context.getApplicationContext();
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage getApplicationContext applicationContext: %{public}s',
          JSON.stringify(applicationContext));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker AbilityStage getApplicationContext failed: %{public}s',
          JSON.stringify(error));
      }

      hilog.info(0x0000, 'testTag', '%{public}s', 'Worker AbilityStage getGroupDir');
      context.getGroupDir('1', (err: BusinessError, data) => {
        if (err) {
          console.error(`Worker AbilityStage getGroupDir faile, err: ${JSON.stringify(err)}`);
        } else {
          console.log(`Worker AbilityStage getGroupDir result is: ${JSON.stringify(data)}`);
        }
      });

      // 独有的属性
      // currentHapModuleInfo
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.currentHapModuleInfo: %{public}s',
        JSON.stringify(context.currentHapModuleInfo));
      // config
      hilog.info(0x0000, 'testTag', 'Worker AbilityStage context.config: %{public}s', JSON.stringify(context.config));
      workerPort.postMessage({'key': '[NormalContext] AbilityStageContext after convert and post', 'value': 'succeed'});
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Worker abilitystage context convert to abilitystage context failed %{public}s',
        JSON.stringify(error));
      workerPort.postMessage({'key': '[NormalContext] AbilityStageContext after convert and post', 'value': 'failed'});
    }
  }

  if (object.contextName === 'ApplicationContext') {
    // case1: type-matched convert
    hilog.info(0x0000, 'testTag', '%{public}s', 'application context convert to application context.');
    try {
      let context: common.ApplicationContext = normalContext as common.ApplicationContext;
      // 获取context后获取沙箱路径
      hilog.info(0x0000, 'testTag', 'application context convert to application context: %{public}s',
        JSON.stringify(context));
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.resourceManager: %{public}s',
        JSON.stringify(context.resourceManager));
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.applicationInfo: %{public}s',
        JSON.stringify(context.applicationInfo));
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.cacheDir: %{public}s', context.cacheDir);
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.tempDir: %{public}s', context.tempDir);
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.filesDir: %{public}s', context.filesDir);
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.databaseDir: %{public}s', context.databaseDir);
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.preferencesDir: %{public}s',
        context.preferencesDir);
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.bundleCodeDir: %{public}s',
        context.bundleCodeDir);
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.distributedFilesDir: %{public}s',
        context.distributedFilesDir);
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.resourceDir: %{public}s', context.resourceDir);
      hilog.info(0x0000, 'testTag', 'Worker ApplicationContext context.area: %{public}d', context.area);
      // eventhub
      // switch area
      context.area = contextConstant.AreaMode.EL4;
      // other func

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker ApplicationContext createBundleContext');
        let bundleContext: common.Context = context.createBundleContext('com.acts.sendablecontextsameworker');
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext createBundleContext bundleContext: %{public}s',
          JSON.stringify(bundleContext));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext createBundleContext failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker ApplicationContext createModuleContext');
        let moduleContext1: common.Context = context.createModuleContext('entry');
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext createModuleContext moduleContext1: %{public}s',
          JSON.stringify(moduleContext1));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext createModuleContext failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker ApplicationContext createModuleContext');
        let moduleContext2: common.Context = context.createModuleContext('com.acts.sendablecontextsameworker', 'entry');
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext createModuleContext moduleContext2: %{public}s',
          JSON.stringify(moduleContext2));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext createModuleContext failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker ApplicationContext createSystemHspModuleResourceManager');
        let resMgr1: resourceManager.ResourceManager =
          context.createSystemHspModuleResourceManager('com.acts.sendablecontextsameworker', 'entry');
        let config = resMgr1.getConfigurationSync();
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext resMgr1 config: %{public}s', JSON.stringify(config));
      } catch (error) {
        // cause 'entry' is not a hsp, it will failed.
        hilog.info(0x0000, 'testTag',
          'Worker ApplicationContext createSystemHspModuleResourceManager failed: %{public}s', JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker ApplicationContext createModuleResourceManager');
        let resMgr2: resourceManager.ResourceManager =
          context.createModuleResourceManager('com.acts.sendablecontextsameworker', 'entry');
        let config = resMgr2.getConfigurationSync();
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext resMgr2 config: %{public}s', JSON.stringify(config));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext createModuleResourceManager failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker ApplicationContext getApplicationContext');
        let applicationContext: common.ApplicationContext = context.getApplicationContext();
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext getApplicationContext applicationContext: %{public}s',
          JSON.stringify(applicationContext));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker ApplicationContext getApplicationContext failed: %{public}s',
          JSON.stringify(error));
      }

      hilog.info(0x0000, 'testTag', '%{public}s', 'Worker ApplicationContext getGroupDir');
      context.getGroupDir('1', (err: BusinessError, data) => {
        if (err) {
          console.error(`Worker ApplicationContext getGroupDir faile, err: ${JSON.stringify(err)}`);
        } else {
          console.log(`Worker ApplicationContext getGroupDir result is: ${JSON.stringify(data)}`);
        }
      });

      workerPort.postMessage({'key': '[NormalContext] ApplicationContext after convert and post', 'value': 'succeed'});
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'application context convert to application context failed %{public}s',
        JSON.stringify(error));
      workerPort.postMessage({'key': '[NormalContext] ApplicationContext after convert and post', 'value': 'failed'});
    }
  }

  if (object.contextName === 'BaseContext') {
    // case1: type-matched convert
    hilog.info(0x0000, 'testTag', '%{public}s', 'base context convert to base context.');
    // type-matched convert
    try {
      let context: common.Context = normalContext as common.Context;
      // 基类
      hilog.info(0x0000, 'testTag', 'base context convert to base context: %{public}s', JSON.stringify(context));
      hilog.info(0x0000, 'testTag', 'Worker base context.resourceManager: %{public}s',
        JSON.stringify(context.resourceManager));
      hilog.info(0x0000, 'testTag', 'Worker base context.applicationInfo: %{public}s',
        JSON.stringify(context.applicationInfo));
      hilog.info(0x0000, 'testTag', 'Worker base context.cacheDir: %{public}s', context.cacheDir);
      hilog.info(0x0000, 'testTag', 'Worker base context.tempDir: %{public}s', context.tempDir);
      hilog.info(0x0000, 'testTag', 'Worker base context.filesDir: %{public}s', context.filesDir);
      hilog.info(0x0000, 'testTag', 'Worker base context.databaseDir: %{public}s', context.databaseDir);
      hilog.info(0x0000, 'testTag', 'Worker base context.preferencesDir: %{public}s', context.preferencesDir);
      hilog.info(0x0000, 'testTag', 'Worker base context.bundleCodeDir: %{public}s', context.bundleCodeDir);
      hilog.info(0x0000, 'testTag', 'Worker base context.distributedFilesDir: %{public}s', context.distributedFilesDir);
      hilog.info(0x0000, 'testTag', 'Worker base context.resourceDir: %{public}s', context.resourceDir);
      hilog.info(0x0000, 'testTag', 'Worker base context.area: %{public}d', context.area);
      // eventhub
      // switch area
      context.area = contextConstant.AreaMode.EL3;
      // other func

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker baseContext createBundleContext');
        let bundleContext: common.Context = context.createBundleContext('com.acts.sendablecontextsameworker');
        hilog.info(0x0000, 'testTag', 'Worker baseContext createBundleContext bundleContext: %{public}s',
          JSON.stringify(bundleContext));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker baseContext createBundleContext failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker baseContext createModuleContext');
        let moduleContext1: common.Context = context.createModuleContext('entry');
        hilog.info(0x0000, 'testTag', 'Worker baseContext createModuleContext moduleContext1: %{public}s',
          JSON.stringify(moduleContext1));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker baseContext createModuleContext failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker baseContext createModuleContext');
        let moduleContext2: common.Context = context.createModuleContext('com.acts.sendablecontextsameworker', 'entry');
        hilog.info(0x0000, 'testTag', 'Worker baseContext createModuleContext moduleContext2: %{public}s',
          JSON.stringify(moduleContext2));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker baseContext createModuleContext failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker baseContext createSystemHspModuleResourceManager');
        let resMgr1: resourceManager.ResourceManager =
          context.createSystemHspModuleResourceManager('com.acts.sendablecontextsameworker', 'entry');
        let config = resMgr1.getConfigurationSync();
        hilog.info(0x0000, 'testTag', 'Worker baseContext resMgr1 config: %{public}s', JSON.stringify(config));
      } catch (error) {
        // cause 'entry' is not a hsp, it will failed.
        hilog.info(0x0000, 'testTag', 'Worker baseContext createSystemHspModuleResourceManager failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker baseContext createModuleResourceManager');
        let resMgr2: resourceManager.ResourceManager =
          context.createModuleResourceManager('com.acts.sendablecontextsameworker', 'entry');
        let config = resMgr2.getConfigurationSync();
        hilog.info(0x0000, 'testTag', 'Worker baseContext resMgr2 config: %{public}s', JSON.stringify(config));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker baseContext createModuleResourceManager failed: %{public}s',
          JSON.stringify(error));
      }

      try {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Worker baseContext getApplicationContext');
        let applicationContext: common.ApplicationContext = context.getApplicationContext();
        hilog.info(0x0000, 'testTag', 'Worker baseContext getApplicationContext applicationContext: %{public}s',
          JSON.stringify(applicationContext));
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'Worker baseContext getApplicationContext failed: %{public}s',
          JSON.stringify(error));
      }

      hilog.info(0x0000, 'testTag', '%{public}s', 'Worker baseContext getGroupDir');
      context.getGroupDir('1', (err: BusinessError, data) => {
        if (err) {
          console.error(`Worker baseContext getGroupDir faile, err: ${JSON.stringify(err)}`);
        } else {
          console.log(`Worker baseContext getGroupDir result is: ${JSON.stringify(data)}`);
        }
      });

      // 独有的方法
      workerPort.postMessage({'key': '[NormalContext] Context after convert and post', 'value': 'succeed'});
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'base context convert to base context failed %{public}s', JSON.stringify(error));
      workerPort.postMessage({'key': '[NormalContext] Context after convert and post', 'value': 'failed'});
    }
  }
}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessageerror = (e: MessageEvents) => {
  hilog.info(0x0000, 'testTag', '%{public}s', 'onmessageerror');
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param e error message
 */
workerPort.onerror = (e: ErrorEvent) => {
  hilog.info(0x0000, 'testTag', '%{public}s', 'onerror');
}