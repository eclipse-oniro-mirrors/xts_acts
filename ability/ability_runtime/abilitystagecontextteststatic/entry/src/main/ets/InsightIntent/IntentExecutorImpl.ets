/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import InsightIntentExecutor from '@ohos.app.ability.InsightIntentExecutor';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import insightIntent from '@ohos.app.ability.insightIntent'
import window from '@ohos.window';
import hilog from '@ohos.hilog'
import Want from '@ohos.app.ability.Want';
import { RecordData } from '@ohos.base';

export default class IntentExecutorImpl extends InsightIntentExecutor {
  onExecuteInUIAbilityForegroundMode(name: string, param: Record<string, RecordData>,
    pageLoader: window.WindowStage): insightIntent.ExecuteResult {

    let want: Want = {
      bundleName: 'com.ohos.intentexecutedemo',
      moduleName: 'entry',
      abilityName: 'AnotherAbility',
    };

    try {
      this.context.startAbility(want, (error) => {
        if (error) {
          hilog.error(0x0000, 'testTag', 'Start ability failed with %{public}s', JSON.stringify(error));
        } else {
          hilog.info(0x0000, 'testTag', '%{public}s', 'Start ability succeed');
        }
      })
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Start ability error caught %{public}s', JSON.stringify(error));
    }

    let want1: Want = {
      bundleName: 'com.ohos.intentexecutedemo1',
      moduleName: 'entry1',
      abilityName: 'AnotherAbility1',
    };

    try {
      await this.context.startAbility(want1);
      hilog.info(0x0000, 'testTag', '%{public}s', 'Start ability finished');
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Start ability error caught %{public}s', JSON.stringify(error));
    }

    let result: insightIntent.ExecuteResult;
    if (name !== 'SupportedInsightIntentName') {
      hilog.warn(0x0000, 'testTag', 'Unsupported insight intent %{public}s', name);
      result = {
        // decided by developer
        code: 404,
        result: {
          'message': 'Unsupported insight intent.',
        } as Record<string, RecordData>,
        uris: [],
        flags: 25
      };
      return result;
    }

    // if developer need load content
    pageLoader.loadContent('pages/Index', (err, data) => {
      if (err?.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
      } else {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Succeeded in loading the content');
      }
    });

    result = {
      code: 0,
      result: {
        'message': 'Execute insight intent succeed.',
      } as Record<string, RecordData>
    };
    return result;
  }

  onExecuteInUIAbilityBackgroundMode(name: string,
    param: Record<string, RecordData>): insightIntent.ExecuteResult {
    let result: insightIntent.ExecuteResult = {
      code: 0,
      result: {
        'message': 'Execute insight intent succeed.',
      } as Record<string, RecordData>
    };
    return result;
  }

  onExecuteInUIExtensionAbility(name: string, param: Record<string, RecordData>,
    pageLoader: UIExtensionContentSession): insightIntent.ExecuteResult {
    let result: insightIntent.ExecuteResult;
    if (name !== 'SupportedInsightIntentName') {
      hilog.warn(0x0000, 'testTag', 'Unsupported insight intent %{public}s', name);
      result = {
        // decided by developer
        code: 404,
        result: {
          'message': 'Unsupported insight intent.',
        } as Record<string, RecordData>
      };
      return result;
    }

    // if developer need load content
    pageLoader.loadContent('pages/Index');

    result = {
      code: 0,
      result: {
        'message': 'Execute insight intent succeed.',
      } as Record<string, RecordData>
    };
    return result;
  }

  onExecuteInServiceExtensionAbility(name: string,
    param: Record<string, RecordData>): insightIntent.ExecuteResult {
    let result: insightIntent.ExecuteResult;
    if (name !== 'SupportedInsightIntentName') {
      hilog.warn(0x0000, 'testTag', 'Unsupported insight intent %{public}s', name);
      result = {
        // decided by developer
        code: 404,
        result: {
          'message': 'Unsupported insight intent.',
        } as Record<string, RecordData>
      };
      return result;
    }

    result = {
      code: 0,
      result: {
        'message': 'Execute insight intent succeed.',
      } as Record<string, RecordData>
    };
    return result;
  }
}
