import { UIExtensionContentSession } from '@kit.AbilityKit';
let storage = new LocalStorage()

@Entry
@Component
struct EntryEmbeddedUIExtAbilityPage {
  @State message: string = 'EmbeddedUIExtAbility';
  private session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session');

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }.width('100%').height('100%')
  }
}
