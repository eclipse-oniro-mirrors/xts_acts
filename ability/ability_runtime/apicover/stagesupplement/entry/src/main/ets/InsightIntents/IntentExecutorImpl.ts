/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import IntentExecutor from '@ohos.app.ability.InsightIntentExecutor';
import IntentContext from '@ohos.app.ability.InsightIntentContext';
import insightIntent from '@ohos.app.ability.insightIntent';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import window from '@ohos.window';
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';
import wantConstant from '@ohos.app.ability.wantConstant';

const LOG_TAG: string = 'testTag-IntentExecutor';
let UI_ABILITY_FOREGROUND: number = insightIntent.ExecuteMode.UI_ABILITY_FOREGROUND;
let UI_ABILITY_BACKGROUND: number = insightIntent.ExecuteMode.UI_ABILITY_BACKGROUND;
let UI_EXTENSION_ABILITY: number = insightIntent.ExecuteMode.UI_EXTENSION_ABILITY;

function startAnotherAbility(context: IntentContext) {
  let want: Want = {
    bundleName: 'com.ohos.intentexecutedemo',
    moduleName: 'entry',
    abilityName: 'AnotherAbility',
  };

  try {
    context.startAbility(want, (error) => {
      if (error) {
        hilog.error(0x0000, LOG_TAG, 'Start ability failed with %{public}s', JSON.stringify(error) ?? '');
      } else {
        hilog.info(0x0000, LOG_TAG, '%{public}s', 'Start ability succeed');
      }
    })
  } catch (error) {
    hilog.error(0x0000, LOG_TAG, 'Start ability error caught %{public}s', JSON.stringify(error) ?? '');
  }
}

function startAbilityOfDifferentBundle(context: IntentContext) {
  let want: Want = {
    // Other bundle, expect can't started.
    bundleName: 'com.ohos.intentdriverdemo',
    moduleName: 'entry',
    abilityName: 'EntryAbility',
  };

  try {
    context.startAbility(want, (error) => {
      if (error) {
        hilog.error(0x0000, LOG_TAG, 'Start ability of other bundle failed with %{public}s', JSON.stringify(error) ?? '');
      } else {
        hilog.info(0x0000, LOG_TAG, '%{public}s', 'Start ability of other bundle succeed');
      }
    })
  } catch (error) {
    hilog.error(0x0000, LOG_TAG, 'Start ability of other bundle error caught %{public}s', JSON.stringify(error) ?? '');
  }
}

export default class IntentExecutorImpl extends IntentExecutor {
  onExecuteInUIAbilityForegroundMode(name: string, param: Record<string, Object>, pageLoader: window.WindowStage): insightIntent.ExecuteResult {
    hilog.info(0x0000, LOG_TAG, 'IntentName %{public}s, IntentParam %{public}s', name, JSON.stringify(param) ?? '');

    // start ability or not depends on "action" in intent param
    let action = param.action;
    if (action === 'startAnotherAbility') {
      startAnotherAbility(this.context);
    } else if (action === 'startAbilityOfDifferentBundle') {
      startAbilityOfDifferentBundle(this.context);
    } else {
      // load other page
      pageLoader.loadContent('pages/PlayMusicIntentIndex', (err, data) => {
        if (err.code) {
          hilog.error(0x0000, LOG_TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
          return;
        }
        hilog.info(0x0000, LOG_TAG, 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
      });
    }

    hilog.info(0x0000, LOG_TAG, 'Execute mode %{public}d', UI_ABILITY_FOREGROUND);
    let result: insightIntent.ExecuteResult;
    if (name !== 'PlayMusic') {
      hilog.warn(0x0000, LOG_TAG, 'Unsupported intentName %{public}s', name);
      result = {
        code: 404,
        result: {
          message: 'Not Support intent.',
        }
      };
      hilog.info(0x0000, LOG_TAG, 'Execute UIAbility in foreground mode finished, result %{public}s', JSON.stringify(result) ?? '');
      return result;
    }

    result = {
      code: 0,
      result: {
        message: 'Play music succeed.',
      },
      flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
      uris: ['file:\\bundlename\\uri']
    };
    hilog.info(0x0000, LOG_TAG, 'Execute UIAbility in foreground mode finished, result %{public}s', JSON.stringify(result) ?? '');
    return result;
  }

  onExecuteInUIAbilityBackgroundMode(name: string, param: Record<string, Object>): insightIntent.ExecuteResult {
    hilog.info(0x0000, LOG_TAG, 'IntentName %{public}s, IntentParam %{public}s', name, JSON.stringify(param) ?? '');
    hilog.info(0x0000, LOG_TAG, 'Execute mode %{public}d', UI_ABILITY_BACKGROUND);
    let result: insightIntent.ExecuteResult = {
      code: 404,
      result: {
        message: 'Nothing',
      }
    };
    hilog.info(0x0000, LOG_TAG, 'Execute UIAbility in background mode finished, result %{public}s', JSON.stringify(result) ?? '');
    return result;
  }

  onExecuteInUIExtensionAbility(name: string, param: Record<string, Object>, pageLoader: UIExtensionContentSession): insightIntent.ExecuteResult {
    hilog.info(0x0000, LOG_TAG, 'IntentName %{public}s, IntentParam %{public}s', name, JSON.stringify(param) ?? '');
    hilog.info(0x0000, LOG_TAG, 'Execute mode %{public}d', UI_EXTENSION_ABILITY);
    let result: insightIntent.ExecuteResult = {
      code: 404,
      result: {
        message: 'Nothing',
      }
    };
    hilog.info(0x0000, LOG_TAG, 'Execute in UIExtension mode finished, result %{public}s', JSON.stringify(result) ?? '');
    return result;
  }

  onExecuteInServiceExtensionAbility(name: string, param: Record<string, Object>): insightIntent.ExecuteResult {
    hilog.info(0x0000, LOG_TAG, 'IntentName %{public}s, IntentParam %{public}s', name, JSON.stringify(param) ?? '');
    let result: insightIntent.ExecuteResult = {
      code: 404,
      result: {
        message: 'Nothing',
      }
    };
    hilog.info(0x0000, LOG_TAG, 'Execute UIAbility in service mode finished, result %{public}s', JSON.stringify(result) ?? '');
    return result;
  }
}