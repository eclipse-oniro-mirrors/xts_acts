/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

import { PhotoEditorExtensionAbility,UIExtensionContentSession,Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';

const TAG = 'MuseEditorExtensionAbility';


export default class MuseEditorExtensionAbility extends PhotoEditorExtensionAbility {
    onCreate() {
        hilog.info(0x0000, TAG, 'MuseEditorExtensionAbility onCreate')
    }

    onStartContentEditing(uri: string, want: Want, session: UIExtensionContentSession): void {
        hilog.info(0x0000, TAG, `startContentEditing want ==> ${JSON.stringify(want)}`)

        const storage: LocalStorage = new LocalStorage({
            'session': session,
            'callerWant': want,
            'uri': uri
        } as Record<string, Object>);

        session.loadContent('pages/PhotoEditor', storage);
    }

    onForeground() {
        hilog.info(0x0000, TAG, 'MuseEditorExtensionAbility onForeground');
    }

    onBackground() {
        hilog.info(0x0000, TAG, 'MuseEditorExtensionAbility onBackground');
    }

    onDestroy() {
        hilog.info(0x0000, TAG, 'MuseEditorExtensionAbility onDestroy');
    }
}