import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DeleteResult, Repository } from 'typeorm';
import { CreateApplicationDto } from './dto/create-application.dto';
import { Application } from './entities/application.entity';

@Injectable()
export class ApplicationsService {
  constructor(
    @InjectRepository(Application)
    private appRepo: Repository<Application>,
  ) {}

  async create(data: CreateApplicationDto): Promise<number> {
    return (await this.appRepo.save(data)).appID;
  }

  async findAll(): Promise<Application[]> {
    return await this.appRepo.find();
  }

  async findOne(id: number): Promise<Application> {
    return await this.appRepo.findOne(id);
  }

  async remove(id: number): Promise<DeleteResult> {
    return await this.appRepo.delete(id);
  }
}
