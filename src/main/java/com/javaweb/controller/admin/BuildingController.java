package com.javaweb.controller.admin;



import com.javaweb.enums.buildingType;
import com.javaweb.enums.district;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    private final SpringDataWebProperties springDataWebProperties;
    @Autowired
    private IUserService userService;

    public BuildingController(SpringDataWebProperties springDataWebProperties) {
        this.springDataWebProperties = springDataWebProperties;
    }

    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request){
        ModelAndView mav =new ModelAndView("/admin/building/list");
        mav.addObject("modelSearch",buildingSearchRequest);
        List<BuildingSearchResponse> responseList =new ArrayList<>();
        BuildingSearchResponse item1 = new BuildingSearchResponse();
        item1.setId(3L);
        item1.setName("ABM Building");
        item1.setAddress("24 Dang Thai Mai Street");
        item1.setManagerName("Anh Long ");
        item1.setManagerPhoneNumber("090000102");
        item1.setNumberOfBasement(2L);
        responseList.add(item1);
        BuildingSearchResponse item2 = new BuildingSearchResponse();
        item2.setName("Building Infinity");
        item2.setId(5L);
        item2.setAddress("54 Dang Thai Mai Street");
        item2.setManagerName("Chi Nhi ");
        item2.setManagerPhoneNumber("090003232");
        item2.setNumberOfBasement(2L);
        responseList.add(item2);
        mav.addObject("buildingList",responseList);
        mav.addObject("listStaffs",userService.getStaffs());
        mav.addObject("district", district.type());
        mav.addObject("typeBuilding", buildingType.type());
        return mav;
    }
    @GetMapping(value = "/admin/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav =new ModelAndView("/admin/building/edit");
        mav.addObject("district", district.type());
        mav.addObject("typeBuilding", buildingType.type());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav =new ModelAndView("/admin/building/edit");
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO.setName("Man Building");
        buildingDTO.setId(id);
        mav.addObject("buildingEdit",buildingDTO);
        mav.addObject("district", district.type());
        mav.addObject("typeBuilding", buildingType.type());
        return mav;
    }
}
