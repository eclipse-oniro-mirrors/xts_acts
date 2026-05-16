/**
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

import { pluginComponentManager, PluginComponentTemplate } from '@kit.ArkUI';
import { Want } from '@kit.AbilityKit';

type KVObject = Record<string, Object>;

@Entry
@Component
struct PluginComponentManagerNullUndefined {
  build() {
    Column() {
      Text('pluginComponentManager Test')
        .id('pluginComponentManager_title')
    }
    .width('100%')
    .height('100%')
  }

  onPushListener(source: Want, template: PluginComponentTemplate, data: KVObject, extraData: KVObject): void {
    console.info('onPushListener');
  }

  onRequestListener(source: Want, name: string, data: KVObject): Record<string, string | KVObject> {
    let result: Record<string, string | KVObject> = {
      'template': 'testTemplate',
      'data': data,
    };
    return result;
  }

  onReady(): void {
    pluginComponentManager.on('push', this.onPushListener);
    pluginComponentManager.on('request', this.onRequestListener);

    pluginComponentManager.on(null, this.onPushListener);
    pluginComponentManager.on(undefined, this.onPushListener);
    pluginComponentManager.on('', this.onPushListener);

    pluginComponentManager.on('push', null);
    pluginComponentManager.on('push', undefined);

    pluginComponentManager.request(null, (err, data) => {});
    pluginComponentManager.request(undefined, (err, data) => {});
  }
}
