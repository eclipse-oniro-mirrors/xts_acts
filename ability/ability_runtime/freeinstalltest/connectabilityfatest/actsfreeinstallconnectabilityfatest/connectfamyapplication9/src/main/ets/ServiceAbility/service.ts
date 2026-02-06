/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import rpc from '@ohos.rpc';

class StubTest extends rpc.RemoteObject {
    constructor(des) {
        super(des)
    }

    onRemoteRequest(code, data, reply, option) {
        console.info('ServiceAbility myapp9 onRemoteRequest');
        if (code === 1) {
            let op1 = data.readInt();
            let op2 = data.readInt();
            reply.writeInt(op1 + op2);
            console.info('ServiceAbility myapp9 op1:' + op1 + ' op2:' + op2);
        }
        return true;
    }
}

export default {
    onStart() {
        console.info('ServiceAbility myapp9 onStart');
    },
    onStop() {
        console.info('ServiceAbility myapp9 onStop');
    },
    onCommand(want, startId) {
        console.info('ServiceAbility myapp9 onCommand');
    },
    onConnect(want) {
        console.info('ServiceAbility myapp9 onConnect');
        console.info('featureAbility_connectAbility connect myapp9 Servcie success');
        return new StubTest("1");
    },
    onDisConnect(want) {
        console.info('ServiceAbility myapp9 onDisConnect');
    },
};
