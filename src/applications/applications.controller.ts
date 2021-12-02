import { Controller, Get, Post, Body, Param, Delete } from '@nestjs/common';
import { ApplicationsService } from './applications.service';
import { CreateApplicationDto } from './dto/create-application.dto';

@Controller('applications')
export class ApplicationsController {
  constructor(private readonly applicationsService: ApplicationsService) {}

  @Post()
  async create(@Body() data: CreateApplicationDto) {
    const resp = {
      id: await this.applicationsService.create(data),
    };
    return resp;
  }

  @Get()
  async findAll() {
    return this.applicationsService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: number) {
    return this.applicationsService.findOne(id);
  }

  @Delete(':id')
  async remove(@Param('id') id: number) {
    return this.applicationsService.remove(id);
  }
}
