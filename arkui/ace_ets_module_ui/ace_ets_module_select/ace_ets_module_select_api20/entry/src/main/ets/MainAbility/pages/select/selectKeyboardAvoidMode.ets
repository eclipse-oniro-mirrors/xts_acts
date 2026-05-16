import { inputMethod } from '@kit.IMEKit';
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  private inputController: inputMethod.InputMethodController = inputMethod.getController();
  @State modeArray: MenuKeyboardAvoidMode[] = [
    MenuKeyboardAvoidMode.NONE,
    MenuKeyboardAvoidMode.TRANSLATE_AND_RESIZE];
  @State keyboardAvoidMode: string = 'undefined';
  @State private selectOptions: SelectOption[] = [
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ddd',
    },
    {
      value: '123',
    },
    {
      value: '456',
    },
    {
      value: '789',
    },
    {
      value: 'bbr',
    }

  ];
  @State private selectOptions1: SelectOption[] = [
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ddd',
    }

  ];

  build() {
    Flex () {
      Column() {
        Text(this.keyboardAvoidMode).id('modeType')
        Button('hide')
          .width('80%')
          .height(60)
          .fontSize(20)
          .margin(20)
          .onClick(() => {
            // 显示软键盘
            this.hideKeyboard();
          })
          .id('hideBtn')
      }

      Select(this.selectOptions)
        .value('1111')
        .id('select01')
        .margin('20px')
        .minKeyboardAvoidDistance(LengthMetrics.vp(10))
        .onClick(() => {
          this.keyboardAvoidMode = 'undefined'
          setTimeout(() => {
            this.attachAndListener()
          }, 2000)

        })
      Select(this.selectOptions)
        .value('222222')
        .id('select02')
        .margin('20px')
        // .keyboardAvoidMode(MenuKeyboardAvoidMode.NONE)
        .keyboardAvoidMode(this.modeArray[0])
        .minKeyboardAvoidDistance(LengthMetrics.vp(10))
        .onClick(() => {
          setTimeout(() => {
            this.attachAndListener()
          }, 2000)
          this.keyboardAvoidMode = this.modeArray[0].toString()
        })
      Select(this.selectOptions1)
        .value('Click Show Options')
        .selected(17)
        .id('select03')
        // .keyboardAvoidMode(MenuKeyboardAvoidMode.TRANSLATE_AND_RESIZE)
        .keyboardAvoidMode(this.modeArray[1])
        .minKeyboardAvoidDistance(LengthMetrics.vp(20))
        .onClick(() => {
          setTimeout(() => {
            this.attachAndListener()
          }, 2000)
          this.keyboardAvoidMode = this.modeArray[1].toString()
        })
    }
    .position({ bottom: 20 })
    .height('50%')
    .width('100%')
  }

  async attachAndListener() {
    focusControl.requestFocus('Index')
    try {
      await this.inputController.attach(true, {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.TEXT,
          enterKeyType: inputMethod.EnterKeyType.SEARCH
        }
      })
    } catch (err) {
      console.error('Fail to attach')
    }
  }
  async hideKeyboard() {
    try {
      // 隐藏软键盘
      //await this.inputController.hide();

      // 可选：断开输入法连接以完全释放资源
      await this.inputController.detach();

    } catch (err) {
      console.error('Fail to hide keyboard: ' + JSON.stringify(err));
    }
  }
}