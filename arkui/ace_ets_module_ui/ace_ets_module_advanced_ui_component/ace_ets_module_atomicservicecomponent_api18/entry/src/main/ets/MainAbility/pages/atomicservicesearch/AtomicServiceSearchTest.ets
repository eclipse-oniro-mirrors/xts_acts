import { AtomicServiceSearch, SearchParams, SelectParams} from '@kit.ArkUI';

@Entry
@Component
struct AtomicServiceSearchTest {
  @State private placeholder: string = 'Type to Search...';
  @State private defaultValue: string = 'default';
  @State private search?: SearchParams = {};
  @State private select?: SelectParams = {
    options: [
      { value: 'Select1', icon: $r('app.media.icon') },
      { value: 'Select2', icon: $r('app.media.icon') },
      { value: 'Select3', icon: $r('app.media.icon') },
      { value: 'Select4', icon: $r('app.media.icon') }
    ],
    selected: -1,
    selectValue: 'Select1',
    onSelect: (index: number) => {
      if (index === 0) {
        this.alert('Select1');
      } else if (index === 1) {
        this.alert('Select2');
      } else if (index === 2) {
        this.alert('Select3');
      } else if (index === 3) {
        this.alert('Select4');
      }
    }
  };

  build() {
    Column({ space: 8 }) {
      Text('AtomicServiceSearch修改样式').alignSelf(ItemAlign.Start).decoration({
        type: TextDecorationType.Underline,
        color: Color.Black,
        style: TextDecorationStyle.SOLID
      }).margin({ top: 20, bottom: 20 })

      AtomicServiceSearch({
        value: this.defaultValue,
        placeholder: this.placeholder,
        select: this.select,
        search: this.search,
        operation: {
          independentItem: {
            value: $r(`app.media.icon`),
            action: () => {
              this.alert('通知');
            }
          }
        }
      })
      Button('修改placeholder')
        .width('100%')
        .type(ButtonType.Normal)
        .borderRadius(20)
        .onClick(() => {
          if (this.placeholder === 'Search...') {
            this.placeholder = 'Type to Search...';
          } else {
            this.placeholder = 'Search...';
          }
        });
      Button('修改defaultValue')
        .width('100%')
        .type(ButtonType.Normal)
        .borderRadius(20)
        .onClick(() => {
          if (this.defaultValue === 'value') {
            this.defaultValue = 'defaultValue';
          } else {
            this.defaultValue = 'value';
          }
        });
      Button('修改Select样式')
        .width('100%')
        .type(ButtonType.Normal)
        .borderRadius(20)
        .onClick(() => {
          this.select = {
            options: [
              { value: '选项1', icon: $r('app.media.icon') },
              { value: '选项2', icon: $r('app.media.icon') },
            ],
            selected: -1,
            selectValue: '选项1',
            onSelect: (index: number) => {
              if (index === 0) {
                this.alert('选项1');
              } else if (index === 1) {
                this.alert('选项2');
              }
            }
          };
        });

      Button('修改Search样式')
        .width('100%')
        .type(ButtonType.Normal)
        .borderRadius(20)
        .onClick(() => {
          this.search = {
            componentBackgroundColor: '#e0eee8'
          }
        });
    }.padding({ left: 16, right: 16 })
  }

  private alert(message: string): void {
    AlertDialog.show({
      message: message
    })
  }
}
