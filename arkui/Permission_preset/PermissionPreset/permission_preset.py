from hypium import BY, Launcher
from hypium.advance.perf.action import UiExplorerPerf
from hypium.advance.perf.model_base import ModelBase
from hypium.model import UiParam


'''
@原子用例
@预置条件
无
@用例步骤
1、回到桌面首页
2、左滑进入负一屏
3、检测小艺弹窗

'''


class PermissionPreset(ModelBase):

    def __init__(self, uidriver: UiExplorerPerf, case_id):
        ModelBase.__init__(self, uidriver, case_id)
        self.scene_no = "CameraVideoView"
        self.scene_name = "负一屏小艺预置"
        self.driver = uidriver

    def setup(self):
        Launcher.go_home(self.driver)

    @ModelBase.scene_recover
    def execute(self):
        driver = self.driver
        # 1、回到桌面首页
        driver.go_home()
        driver.wait(2)
        # 2、左滑进入负一屏
        driver.swipe(UiParam.RIGHT, distance=60, start_point=(0.8, 0.5))
        driver.wait(1)
        # 3、检测小艺弹窗
        # 开启负一屏
        open_fuyiping = driver.wait_for_component(BY.text("开启负一屏"))
        if open_fuyiping is not None:
            driver.touch(open_fuyiping)
        driver.wait(1)
        # 同意    Paf.Permission.button_confirm
        accept_button = driver.wait_for_component(BY.text("同意"))
        if accept_button is not None:
            driver.touch(accept_button)
            driver.wait(1)
        # 服务, 搜索         服务686, 247
        search = driver.wait_for_component(BY.text("服务, 搜索"))
        if search is not None:
            search_button = search
        else:
            search_button = driver.wait_for_component(BY.text("服务"))
        driver.touch(search_button)
        driver.wait(1)
        # 同意    Paf.Permission.button_confirm
        accept_button = driver.wait_for_component(BY.text("同意"))
        if accept_button is not None:
            driver.touch(accept_button)
            driver.wait(1)
        # 下一步
        next_button = driver.wait_for_component(BY.text("下一步"))
        if next_button is not None:
            driver.touch(next_button)
            driver.wait(1)

        # 点击搜索框
        search_field = driver.wait_for_component(BY.type("SearchField"))
        if search_field is not None:
            driver.touch(search_field)
            driver.wait(1)

        # 回到桌面
        driver.go_home()