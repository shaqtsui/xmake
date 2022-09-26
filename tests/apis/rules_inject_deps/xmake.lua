rule("cppfront")
    set_extensions(".cpp2")
    on_load(function (target)
        local rule = target:rule("c++.build.modules.builder"):clone()
        rule:add_deps("cppfront", {order = true})
        target:rule_set("c++.build.modules.builder", rule)
    end)
    before_build_files(function (target, batchjobs, sourcebatch, opt)
        print("build cppfront files")
    end, {batch = true})

target("test")
    set_kind("binary")
    add_rules("cppfront")
    set_languages("c++20")
    add_files("src/*.cpp")
    add_files("src/*.mpp")
    add_files("src/*.cpp2")

