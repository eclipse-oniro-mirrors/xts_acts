import { UIContext } from '@kit.ArkUI';
import animatendk from 'libanimatendk.so'
@Entry
@Component
struct AnimatorTest {

  aboutToAppear() {
    // 获取当前组件的UIContext实例
    animatendk.GetArkUIContext(this.getUIContext())
  }

  build() {
    // 组件UI结构...
  }
}