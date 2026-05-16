import { UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { EmbeddedUIExtensionAbility } from '@kit.AbilityKit';

const TAG: string = '[UIExtAbility]'

export default class ExampleEmbeddedAbility extends EmbeddedUIExtensionAbility {
  onCreate(): void {
    console.log(TAG, `UIExtAbility onCreate`)

  }

  onForeground(): void {
    console.log(TAG, `UIExtAbility onForeground`)
  }

  onBackground(): void {
    console.log(TAG, `UIExtAbility onBackground`)
  }

  onDestroy(): void {
    console.log(TAG, `UIExtAbility onDestroy`)
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession): void {
    console.log(TAG, `UIExtAbility onSessionCreate, want: ${JSON.stringify(want)}`)
    let param: Record<string, UIExtensionContentSession> = {
      'session': session
    };
    let storage: LocalStorage = new LocalStorage(param);
    let pageName = `uiextability/pages/${want.parameters?.pageName}`
    session.loadContent(pageName, storage);
  }

  onSessionDestroy(session: UIExtensionContentSession): void {
    console.log(TAG, `UIExtAbility onSessionDestroy`)
  }
}